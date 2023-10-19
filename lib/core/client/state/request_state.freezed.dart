// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RequestStatus<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DioException error) error,
    required TResult Function(T data) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DioException error)? error,
    TResult? Function(T data)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DioException error)? error,
    TResult Function(T data)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialRequestStatus<T> value) initial,
    required TResult Function(LoadingRequestStatus<T> value) loading,
    required TResult Function(ErrorRequestStatus<T> value) error,
    required TResult Function(SuccessRequestStatus<T> value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialRequestStatus<T> value)? initial,
    TResult? Function(LoadingRequestStatus<T> value)? loading,
    TResult? Function(ErrorRequestStatus<T> value)? error,
    TResult? Function(SuccessRequestStatus<T> value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialRequestStatus<T> value)? initial,
    TResult Function(LoadingRequestStatus<T> value)? loading,
    TResult Function(ErrorRequestStatus<T> value)? error,
    TResult Function(SuccessRequestStatus<T> value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestStatusCopyWith<T, $Res> {
  factory $RequestStatusCopyWith(
          RequestStatus<T> value, $Res Function(RequestStatus<T>) then) =
      _$RequestStatusCopyWithImpl<T, $Res, RequestStatus<T>>;
}

/// @nodoc
class _$RequestStatusCopyWithImpl<T, $Res, $Val extends RequestStatus<T>>
    implements $RequestStatusCopyWith<T, $Res> {
  _$RequestStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialRequestStatusCopyWith<T, $Res> {
  factory _$$InitialRequestStatusCopyWith(_$InitialRequestStatus<T> value,
          $Res Function(_$InitialRequestStatus<T>) then) =
      __$$InitialRequestStatusCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialRequestStatusCopyWithImpl<T, $Res>
    extends _$RequestStatusCopyWithImpl<T, $Res, _$InitialRequestStatus<T>>
    implements _$$InitialRequestStatusCopyWith<T, $Res> {
  __$$InitialRequestStatusCopyWithImpl(_$InitialRequestStatus<T> _value,
      $Res Function(_$InitialRequestStatus<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialRequestStatus<T> implements InitialRequestStatus<T> {
  const _$InitialRequestStatus();

  @override
  String toString() {
    return 'RequestStatus<$T>.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialRequestStatus<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DioException error) error,
    required TResult Function(T data) success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DioException error)? error,
    TResult? Function(T data)? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DioException error)? error,
    TResult Function(T data)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialRequestStatus<T> value) initial,
    required TResult Function(LoadingRequestStatus<T> value) loading,
    required TResult Function(ErrorRequestStatus<T> value) error,
    required TResult Function(SuccessRequestStatus<T> value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialRequestStatus<T> value)? initial,
    TResult? Function(LoadingRequestStatus<T> value)? loading,
    TResult? Function(ErrorRequestStatus<T> value)? error,
    TResult? Function(SuccessRequestStatus<T> value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialRequestStatus<T> value)? initial,
    TResult Function(LoadingRequestStatus<T> value)? loading,
    TResult Function(ErrorRequestStatus<T> value)? error,
    TResult Function(SuccessRequestStatus<T> value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialRequestStatus<T> implements RequestStatus<T> {
  const factory InitialRequestStatus() = _$InitialRequestStatus<T>;
}

/// @nodoc
abstract class _$$LoadingRequestStatusCopyWith<T, $Res> {
  factory _$$LoadingRequestStatusCopyWith(_$LoadingRequestStatus<T> value,
          $Res Function(_$LoadingRequestStatus<T>) then) =
      __$$LoadingRequestStatusCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$LoadingRequestStatusCopyWithImpl<T, $Res>
    extends _$RequestStatusCopyWithImpl<T, $Res, _$LoadingRequestStatus<T>>
    implements _$$LoadingRequestStatusCopyWith<T, $Res> {
  __$$LoadingRequestStatusCopyWithImpl(_$LoadingRequestStatus<T> _value,
      $Res Function(_$LoadingRequestStatus<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingRequestStatus<T> implements LoadingRequestStatus<T> {
  const _$LoadingRequestStatus();

  @override
  String toString() {
    return 'RequestStatus<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingRequestStatus<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DioException error) error,
    required TResult Function(T data) success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DioException error)? error,
    TResult? Function(T data)? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DioException error)? error,
    TResult Function(T data)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialRequestStatus<T> value) initial,
    required TResult Function(LoadingRequestStatus<T> value) loading,
    required TResult Function(ErrorRequestStatus<T> value) error,
    required TResult Function(SuccessRequestStatus<T> value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialRequestStatus<T> value)? initial,
    TResult? Function(LoadingRequestStatus<T> value)? loading,
    TResult? Function(ErrorRequestStatus<T> value)? error,
    TResult? Function(SuccessRequestStatus<T> value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialRequestStatus<T> value)? initial,
    TResult Function(LoadingRequestStatus<T> value)? loading,
    TResult Function(ErrorRequestStatus<T> value)? error,
    TResult Function(SuccessRequestStatus<T> value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingRequestStatus<T> implements RequestStatus<T> {
  const factory LoadingRequestStatus() = _$LoadingRequestStatus<T>;
}

/// @nodoc
abstract class _$$ErrorRequestStatusCopyWith<T, $Res> {
  factory _$$ErrorRequestStatusCopyWith(_$ErrorRequestStatus<T> value,
          $Res Function(_$ErrorRequestStatus<T>) then) =
      __$$ErrorRequestStatusCopyWithImpl<T, $Res>;
  @useResult
  $Res call({DioException error});
}

/// @nodoc
class __$$ErrorRequestStatusCopyWithImpl<T, $Res>
    extends _$RequestStatusCopyWithImpl<T, $Res, _$ErrorRequestStatus<T>>
    implements _$$ErrorRequestStatusCopyWith<T, $Res> {
  __$$ErrorRequestStatusCopyWithImpl(_$ErrorRequestStatus<T> _value,
      $Res Function(_$ErrorRequestStatus<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorRequestStatus<T>(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as DioException,
    ));
  }
}

/// @nodoc

class _$ErrorRequestStatus<T> implements ErrorRequestStatus<T> {
  const _$ErrorRequestStatus(this.error);

  @override
  final DioException error;

  @override
  String toString() {
    return 'RequestStatus<$T>.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorRequestStatus<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorRequestStatusCopyWith<T, _$ErrorRequestStatus<T>> get copyWith =>
      __$$ErrorRequestStatusCopyWithImpl<T, _$ErrorRequestStatus<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DioException error) error,
    required TResult Function(T data) success,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DioException error)? error,
    TResult? Function(T data)? success,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DioException error)? error,
    TResult Function(T data)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialRequestStatus<T> value) initial,
    required TResult Function(LoadingRequestStatus<T> value) loading,
    required TResult Function(ErrorRequestStatus<T> value) error,
    required TResult Function(SuccessRequestStatus<T> value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialRequestStatus<T> value)? initial,
    TResult? Function(LoadingRequestStatus<T> value)? loading,
    TResult? Function(ErrorRequestStatus<T> value)? error,
    TResult? Function(SuccessRequestStatus<T> value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialRequestStatus<T> value)? initial,
    TResult Function(LoadingRequestStatus<T> value)? loading,
    TResult Function(ErrorRequestStatus<T> value)? error,
    TResult Function(SuccessRequestStatus<T> value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorRequestStatus<T> implements RequestStatus<T> {
  const factory ErrorRequestStatus(final DioException error) =
      _$ErrorRequestStatus<T>;

  DioException get error;
  @JsonKey(ignore: true)
  _$$ErrorRequestStatusCopyWith<T, _$ErrorRequestStatus<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessRequestStatusCopyWith<T, $Res> {
  factory _$$SuccessRequestStatusCopyWith(_$SuccessRequestStatus<T> value,
          $Res Function(_$SuccessRequestStatus<T>) then) =
      __$$SuccessRequestStatusCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$SuccessRequestStatusCopyWithImpl<T, $Res>
    extends _$RequestStatusCopyWithImpl<T, $Res, _$SuccessRequestStatus<T>>
    implements _$$SuccessRequestStatusCopyWith<T, $Res> {
  __$$SuccessRequestStatusCopyWithImpl(_$SuccessRequestStatus<T> _value,
      $Res Function(_$SuccessRequestStatus<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SuccessRequestStatus<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$SuccessRequestStatus<T> implements SuccessRequestStatus<T> {
  const _$SuccessRequestStatus(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'RequestStatus<$T>.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessRequestStatus<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessRequestStatusCopyWith<T, _$SuccessRequestStatus<T>> get copyWith =>
      __$$SuccessRequestStatusCopyWithImpl<T, _$SuccessRequestStatus<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DioException error) error,
    required TResult Function(T data) success,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DioException error)? error,
    TResult? Function(T data)? success,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DioException error)? error,
    TResult Function(T data)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialRequestStatus<T> value) initial,
    required TResult Function(LoadingRequestStatus<T> value) loading,
    required TResult Function(ErrorRequestStatus<T> value) error,
    required TResult Function(SuccessRequestStatus<T> value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialRequestStatus<T> value)? initial,
    TResult? Function(LoadingRequestStatus<T> value)? loading,
    TResult? Function(ErrorRequestStatus<T> value)? error,
    TResult? Function(SuccessRequestStatus<T> value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialRequestStatus<T> value)? initial,
    TResult Function(LoadingRequestStatus<T> value)? loading,
    TResult Function(ErrorRequestStatus<T> value)? error,
    TResult Function(SuccessRequestStatus<T> value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessRequestStatus<T> implements RequestStatus<T> {
  const factory SuccessRequestStatus(final T data) = _$SuccessRequestStatus<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$SuccessRequestStatusCopyWith<T, _$SuccessRequestStatus<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
