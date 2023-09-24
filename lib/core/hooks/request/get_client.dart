import 'package:dio/dio.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../client/request_client.dart';
import '../../client/state/request_state.dart';

part 'get_client.g.dart';

typedef RequestHandlerFunc<T> = TaskEither<String, Response<T>> Function(
  String url, {
  Object? data,
  String? method,
  bool hasFile,
});

@riverpod
RequestHandlerFunc requestHandler(RequestHandlerRef ref) {
  final client = ref.watch(requestClientProvider).client;

  TaskEither<String, Response<T>> requestHandler<T>(
    String url, {
    Object? data,
    String? method,
    bool hasFile = false,
  }) =>
      TaskEither<String, Response<T>>.tryCatch(
        () {
          client.options.method = method ?? 'GET';
          client.options.headers['Content-Type'] =
              hasFile ? "multipart/form-data" : 'application/json';

          return client.request<T>(url, data: data);
        },
        (error, stackTrace) => error.toString(),
      );
  return requestHandler;
}

({
  RequestStatus<T> status,
  void Function(String,
      {Object? data,
      bool hasFile,
      String? method,
      void Function(T data)? onSuccess}) trigger
}) useRequestHandler<T>(RequestHandlerFunc<T> takMaker) {
  final result = useState<RequestStatus<T>>(const InitialRequestStatus());

  final runTask = useCallback((String url,
      {Object? data,
      String? method,
      bool hasFile = false,
      void Function(T data)? onSuccess}) {
    result.value = const LoadingRequestStatus();
    // if it has file, then iterate over the data and check if it has file or not and then add it to the form data

    takMaker(
      url,
      data: data,
      method: method,
      hasFile: hasFile,
    ).run().then((either) {
      either.fold(
        (error) {
          result.value = ErrorRequestStatus(error.toString());
        },
        (data) {
          result.value = SuccessRequestStatus(data.data as T);
          onSuccess?.call(data.data as T);
        },
      );
    });
  }, [takMaker]);

  return (
    status: result.value,
    trigger: runTask,
  );
}
