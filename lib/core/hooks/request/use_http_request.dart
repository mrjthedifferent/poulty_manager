import 'package:dio/dio.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../client/request_client.dart';

part 'use_http_request.g.dart';

@riverpod
TaskEither<Exception, Response> makeAutoHttpRequest(
    MakeAutoHttpRequestRef ref, RequestOptions options) {
  final client = ref.watch(requestClientProvider).client;

  final req = AsyncValue.guard(
    () => client.request(options.path,
        data: options.data,
        queryParameters: options.queryParameters,
        options: Options(
          method: options.method,
          headers: options.headers,
          responseType: options.responseType,
          contentType: options.contentType,
          validateStatus: options.validateStatus,
          receiveTimeout: options.receiveTimeout,
          sendTimeout: options.sendTimeout,
          extra: options.extra,
          responseDecoder: options.responseDecoder,
          listFormat: options.listFormat,
          followRedirects: options.followRedirects,
          maxRedirects: options.maxRedirects,
          requestEncoder: options.requestEncoder,
        )),
  );

  return TaskEither.tryCatch(
    () => client.request(
      options.path,
      data: options.data,
      queryParameters: options.queryParameters,
      options: Options(
        method: options.method,
        headers: options.headers,
        responseType: options.responseType,
        contentType: options.contentType,
        validateStatus: options.validateStatus,
        receiveTimeout: options.receiveTimeout,
        sendTimeout: options.sendTimeout,
        extra: options.extra,
        responseDecoder: options.responseDecoder,
        listFormat: options.listFormat,
        followRedirects: options.followRedirects,
        maxRedirects: options.maxRedirects,
        requestEncoder: options.requestEncoder,
      ),
    ),
    (e, s) => Exception(
      e.toString(),
    ),
  );
}

AsyncValue<Response<T>> useAutoRequest<T>(
    TaskEither<Exception, Response<dynamic>> req) {
  final result = useState(AsyncValue<Response<T>>.loading());
  useEffect(() {
    req.run().then((value) {
      result.value = value.fold(
        (l) => AsyncValue.error(l, StackTrace.current),
        (r) => AsyncValue.data(r as Response<T>),
      );
    });
    return null;
  }, []);
  return result.value;
}
