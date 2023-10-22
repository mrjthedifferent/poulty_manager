// ignore: constant_identifier_names
import 'package:dio/dio.dart';
import 'package:poulty_manager/feature/auth/data/remote/remote.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'request_client.g.dart';

// ignore: constant_identifier_names
const BASE_URL = "https://poultrymanagerbd.com/api";

class ApiRequestClient {
  late Dio _dio;

  Dio get client => _dio..options.contentType = 'application/json';

  Dio get clientForMultiPart =>
      _dio..options.contentType = 'multipart/form-data';

  ApiRequestClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        connectTimeout: const Duration(seconds: 20),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );
  }
}

class AddBearerTokenInterceptor extends Interceptor {
  final String? token;

  AddBearerTokenInterceptor({this.token});
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // add bearer token to request header

    options.headers["Authorization"] = "Bearer ${token ?? ""}";

    handler.next(options);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) {
    final responseData = response.data;

    if (responseData
        case {
          'success': bool success,
          'message': String message,
          'data': dynamic data,
        }) {
      if (success) {
        response.data = data;
      } else {
        throw Exception(message);
      }
    } else {
      throw Exception("Invalid response");
    }

    handler.next(response); // continue
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final newErr = err.response?.data['error'] ?? err.response?.data['message'];

    final msg = newErr is String ? newErr : newErr.toString();

    handler.next(err.copyWith(message: msg));
  }
}

@Riverpod(keepAlive: true)
AddBearerTokenInterceptor bearerTokenInterceptor(
    final BearerTokenInterceptorRef ref) {
  final usr = ref.watch(authRepositoryProvider);
  var token = usr.currentUser?.token;
  final subscription =
      usr.authStateChanges().listen((event) => token = event?.token);

  ref.onDispose(() => subscription.cancel());

  return AddBearerTokenInterceptor(token: token);
}

@Riverpod(keepAlive: true)
ApiRequestClient requestClient(RequestClientRef ref) {
  return ApiRequestClient()
    ..client
        .interceptors
        .addAll([ref.watch(bearerTokenInterceptorProvider), LogInterceptor()]);
}
