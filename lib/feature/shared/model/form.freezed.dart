// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FormModel _$FormModelFromJson(Map<String, dynamic> json) {
  return _FormModel.fromJson(json);
}

/// @nodoc
mixin _$FormModel {
  String get name => throw _privateConstructorUsedError;
  String get formTitle => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FormModelCopyWith<FormModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormModelCopyWith<$Res> {
  factory $FormModelCopyWith(FormModel value, $Res Function(FormModel) then) =
      _$FormModelCopyWithImpl<$Res, FormModel>;
  @useResult
  $Res call({String name, String formTitle});
}

/// @nodoc
class _$FormModelCopyWithImpl<$Res, $Val extends FormModel>
    implements $FormModelCopyWith<$Res> {
  _$FormModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? formTitle = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      formTitle: null == formTitle
          ? _value.formTitle
          : formTitle // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FormModelCopyWith<$Res> implements $FormModelCopyWith<$Res> {
  factory _$$_FormModelCopyWith(
          _$_FormModel value, $Res Function(_$_FormModel) then) =
      __$$_FormModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String formTitle});
}

/// @nodoc
class __$$_FormModelCopyWithImpl<$Res>
    extends _$FormModelCopyWithImpl<$Res, _$_FormModel>
    implements _$$_FormModelCopyWith<$Res> {
  __$$_FormModelCopyWithImpl(
      _$_FormModel _value, $Res Function(_$_FormModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? formTitle = null,
  }) {
    return _then(_$_FormModel(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == formTitle
          ? _value.formTitle
          : formTitle // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FormModel implements _FormModel {
  _$_FormModel(this.name, this.formTitle);

  factory _$_FormModel.fromJson(Map<String, dynamic> json) =>
      _$$_FormModelFromJson(json);

  @override
  final String name;
  @override
  final String formTitle;

  @override
  String toString() {
    return 'FormModel(name: $name, formTitle: $formTitle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FormModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.formTitle, formTitle) ||
                other.formTitle == formTitle));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, formTitle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FormModelCopyWith<_$_FormModel> get copyWith =>
      __$$_FormModelCopyWithImpl<_$_FormModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FormModelToJson(
      this,
    );
  }
}

abstract class _FormModel implements FormModel {
  factory _FormModel(final String name, final String formTitle) = _$_FormModel;

  factory _FormModel.fromJson(Map<String, dynamic> json) =
      _$_FormModel.fromJson;

  @override
  String get name;
  @override
  String get formTitle;
  @override
  @JsonKey(ignore: true)
  _$$_FormModelCopyWith<_$_FormModel> get copyWith =>
      throw _privateConstructorUsedError;
}
