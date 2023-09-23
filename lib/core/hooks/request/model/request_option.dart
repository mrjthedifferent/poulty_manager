import 'package:dio/dio.dart';

class RequestOption {
  final String url;
  final String method;
  final Map<String, dynamic>? queryParameters;
  final Object? data;
  final Map<String, dynamic>? headers;
  final CancelToken? cancelToken;
  final Options? options;
  final void Function(int, int)? onSendProgress;
  final void Function(int, int)? onReceiveProgress;

  RequestOption(
    this.url, {
    this.method = 'GET',
    this.queryParameters,
    this.data,
    this.headers,
    this.cancelToken,
    this.options,
    this.onSendProgress,
    this.onReceiveProgress,
  });

  RequestOption copyWith({
    String? url,
    String? method,
    Map<String, dynamic>? queryParameters,
    Object? data,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    Options? options,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) {
    return RequestOption(
      url ?? this.url,
      method: method ?? this.method,
      queryParameters: queryParameters ?? this.queryParameters,
      data: data ?? this.data,
      headers: headers ?? this.headers,
      cancelToken: cancelToken ?? this.cancelToken,
      options: options ?? this.options,
      onSendProgress: onSendProgress ?? this.onSendProgress,
      onReceiveProgress: onReceiveProgress ?? this.onReceiveProgress,
    );
  }
}
