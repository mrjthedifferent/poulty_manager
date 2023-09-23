// ignore: constant_identifier_names
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/feature/auth/data/local/local_user.dart';

part 'request_client.g.dart';

// ignore: constant_identifier_names
const BASE_URL = "https://jsonplaceholder.typicode.com/";

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

  // @override
  // onResponse(Response response, ResponseInterceptorHandler handler) {
  //   final responseData = response.data;

  //   if (responseData
  //       case {
  //         'success': bool success,
  //         'message': String message,
  //         'data': dynamic data,
  //       }) {
  //     if (success) {
  //       response.data = data;
  //     } else {
  //       throw Exception(message);
  //     }
  //   } else {
  //     throw Exception("Invalid response");
  //   }

  //   handler.next(response); // continue
  // }
}

@Riverpod(keepAlive: true)
AddBearerTokenInterceptor bearerTokenInterceptor(
    final BearerTokenInterceptorRef ref) {
  final usr = ref.watch(localUserRepositoryProvider).getUser();
  return AddBearerTokenInterceptor(token: usr?.token);
}

@Riverpod(keepAlive: true)
ApiRequestClient requestClient(RequestClientRef ref) {
  return ApiRequestClient()
    ..client
        .interceptors
        .addAll([ref.watch(bearerTokenInterceptorProvider), LogInterceptor()]);
}
