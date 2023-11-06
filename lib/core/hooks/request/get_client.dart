import 'package:dio/dio.dart';
// ignore: depend_on_referenced_packages
import 'package:file_picker/file_picker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../client/request_client.dart';
import '../../utils/request_state.dart';

part 'get_client.g.dart';

typedef RequestHandlerFunc<T> = TaskEither<DioException, Response<T>> Function(
  String url, {
  Object? data,
  String? method,
  bool hasFile,
});

FormData getFormData(Map<String, dynamic> data) {
  final formData = FormData();
  data.forEach(
    (key, value) {
      if (value is List) {
        for (var i = 0; i < value.length; i++) {
          if (value[i] is PlatformFile) {
            formData.files.add(
              MapEntry(
                "$key[$i]",
                MultipartFile.fromBytes(
                  value[i].bytes!,
                  filename: value[i].name,
                ),
              ),
            );
          } else {
            formData.fields.add(MapEntry(key, value[i]));
          }
        }
      } else {
        if (value is PlatformFile) {
          formData.files.add(
            MapEntry(
              key,
              MultipartFile.fromBytes(
                value.bytes!,
                filename: value.name,
              ),
            ),
          );
        } else {
          formData.fields.add(MapEntry(key, value));
        }
      }
    },
  );
  return formData;
}

@riverpod
RequestHandlerFunc requestHandler(RequestHandlerRef ref) {
  final client = ref.watch(requestClientProvider).client;

  TaskEither<DioException, Response<T>> requestHandler<T>(
    String url, {
    Object? data,
    String? method,
    bool hasFile = false,
  }) =>
      TaskEither<DioException, Response<T>>.tryCatch(
        () {
          client.options.method = method ?? 'GET';
          client.options.headers['Content-Type'] =
              hasFile ? "multipart/form-data" : 'application/json';

          if (hasFile && data is Map<String, dynamic>) {
            final formData = getFormData(data);
            return client.request<T>(url, data: formData);
          }

          return client.request<T>(url, data: data);
        },
        (error, stackTrace) => error as DioException,
      );
  return requestHandler;
}

({
  RequestNetworkState<T> status,
  void Function(String,
      {Object? data,
      bool hasFile,
      String? method,
      void Function(T data)? onSuccess}) trigger
}) useRequestHandler<T>(RequestHandlerFunc<T> takMaker,
    {void Function(DioException err)? onError}) {
  final result = useState<RequestNetworkState<T>>(RequestNetworkInitial());

  final runTask = useCallback((String url,
      {Object? data,
      String? method,
      bool hasFile = false,
      void Function(T data)? onSuccess}) {
    result.value = RequestNetworkLoading();

    takMaker(
      url,
      data: data,
      method: method,
      hasFile: hasFile,
    ).run().then((either) {
      either.fold(
        (error) {
          onError?.call(error);
          result.value = RequestNetworkError(error);
        },
        (data) {
          onSuccess?.call(data.data as T);
          result.value = RequestNetworkData(data.data as T);
        },
      );
    });
  }, [takMaker]);

  return (
    status: result.value,
    trigger: runTask,
  );
}
