import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_state.freezed.dart';

@freezed
class RequestStatus<T> with _$RequestStatus {
  const factory RequestStatus.initial() = InitialRequestStatus;
  const factory RequestStatus.loading() = LoadingRequestStatus;
  const factory RequestStatus.error(DioException error) = ErrorRequestStatus;
  const factory RequestStatus.success(T data) = SuccessRequestStatus;
}
