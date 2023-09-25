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

FormSettings _$FormSettingsFromJson(Map<String, dynamic> json) {
  return _FormSettings.fromJson(json);
}

/// @nodoc
mixin _$FormSettings {
  String get formTitle => throw _privateConstructorUsedError;
  String get formDescription => throw _privateConstructorUsedError;
  List<FieldValue> get formFields => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FormSettingsCopyWith<FormSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormSettingsCopyWith<$Res> {
  factory $FormSettingsCopyWith(
          FormSettings value, $Res Function(FormSettings) then) =
      _$FormSettingsCopyWithImpl<$Res, FormSettings>;
  @useResult
  $Res call(
      {String formTitle, String formDescription, List<FieldValue> formFields});
}

/// @nodoc
class _$FormSettingsCopyWithImpl<$Res, $Val extends FormSettings>
    implements $FormSettingsCopyWith<$Res> {
  _$FormSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formTitle = null,
    Object? formDescription = null,
    Object? formFields = null,
  }) {
    return _then(_value.copyWith(
      formTitle: null == formTitle
          ? _value.formTitle
          : formTitle // ignore: cast_nullable_to_non_nullable
              as String,
      formDescription: null == formDescription
          ? _value.formDescription
          : formDescription // ignore: cast_nullable_to_non_nullable
              as String,
      formFields: null == formFields
          ? _value.formFields
          : formFields // ignore: cast_nullable_to_non_nullable
              as List<FieldValue>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FormSettingsCopyWith<$Res>
    implements $FormSettingsCopyWith<$Res> {
  factory _$$_FormSettingsCopyWith(
          _$_FormSettings value, $Res Function(_$_FormSettings) then) =
      __$$_FormSettingsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String formTitle, String formDescription, List<FieldValue> formFields});
}

/// @nodoc
class __$$_FormSettingsCopyWithImpl<$Res>
    extends _$FormSettingsCopyWithImpl<$Res, _$_FormSettings>
    implements _$$_FormSettingsCopyWith<$Res> {
  __$$_FormSettingsCopyWithImpl(
      _$_FormSettings _value, $Res Function(_$_FormSettings) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formTitle = null,
    Object? formDescription = null,
    Object? formFields = null,
  }) {
    return _then(_$_FormSettings(
      null == formTitle
          ? _value.formTitle
          : formTitle // ignore: cast_nullable_to_non_nullable
              as String,
      null == formDescription
          ? _value.formDescription
          : formDescription // ignore: cast_nullable_to_non_nullable
              as String,
      null == formFields
          ? _value._formFields
          : formFields // ignore: cast_nullable_to_non_nullable
              as List<FieldValue>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FormSettings implements _FormSettings {
  _$_FormSettings(
      this.formTitle, this.formDescription, final List<FieldValue> formFields)
      : _formFields = formFields;

  factory _$_FormSettings.fromJson(Map<String, dynamic> json) =>
      _$$_FormSettingsFromJson(json);

  @override
  final String formTitle;
  @override
  final String formDescription;
  final List<FieldValue> _formFields;
  @override
  List<FieldValue> get formFields {
    if (_formFields is EqualUnmodifiableListView) return _formFields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_formFields);
  }

  @override
  String toString() {
    return 'FormSettings(formTitle: $formTitle, formDescription: $formDescription, formFields: $formFields)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FormSettings &&
            (identical(other.formTitle, formTitle) ||
                other.formTitle == formTitle) &&
            (identical(other.formDescription, formDescription) ||
                other.formDescription == formDescription) &&
            const DeepCollectionEquality()
                .equals(other._formFields, _formFields));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, formTitle, formDescription,
      const DeepCollectionEquality().hash(_formFields));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FormSettingsCopyWith<_$_FormSettings> get copyWith =>
      __$$_FormSettingsCopyWithImpl<_$_FormSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FormSettingsToJson(
      this,
    );
  }
}

abstract class _FormSettings implements FormSettings {
  factory _FormSettings(final String formTitle, final String formDescription,
      final List<FieldValue> formFields) = _$_FormSettings;

  factory _FormSettings.fromJson(Map<String, dynamic> json) =
      _$_FormSettings.fromJson;

  @override
  String get formTitle;
  @override
  String get formDescription;
  @override
  List<FieldValue> get formFields;
  @override
  @JsonKey(ignore: true)
  _$$_FormSettingsCopyWith<_$_FormSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

FieldValue _$FieldValueFromJson(Map<String, dynamic> json) {
  return _FieldValue.fromJson(json);
}

/// @nodoc
mixin _$FieldValue {
  String get slug => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String? get placeholder => throw _privateConstructorUsedError;
  bool? get isRequired => throw _privateConstructorUsedError;
  List<SelectOption>? get options => throw _privateConstructorUsedError;
  FieldValue? get suffix => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FieldValueCopyWith<FieldValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldValueCopyWith<$Res> {
  factory $FieldValueCopyWith(
          FieldValue value, $Res Function(FieldValue) then) =
      _$FieldValueCopyWithImpl<$Res, FieldValue>;
  @useResult
  $Res call(
      {String slug,
      String type,
      String label,
      String? placeholder,
      bool? isRequired,
      List<SelectOption>? options,
      FieldValue? suffix});

  $FieldValueCopyWith<$Res>? get suffix;
}

/// @nodoc
class _$FieldValueCopyWithImpl<$Res, $Val extends FieldValue>
    implements $FieldValueCopyWith<$Res> {
  _$FieldValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slug = null,
    Object? type = null,
    Object? label = null,
    Object? placeholder = freezed,
    Object? isRequired = freezed,
    Object? options = freezed,
    Object? suffix = freezed,
  }) {
    return _then(_value.copyWith(
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      placeholder: freezed == placeholder
          ? _value.placeholder
          : placeholder // ignore: cast_nullable_to_non_nullable
              as String?,
      isRequired: freezed == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<SelectOption>?,
      suffix: freezed == suffix
          ? _value.suffix
          : suffix // ignore: cast_nullable_to_non_nullable
              as FieldValue?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FieldValueCopyWith<$Res>? get suffix {
    if (_value.suffix == null) {
      return null;
    }

    return $FieldValueCopyWith<$Res>(_value.suffix!, (value) {
      return _then(_value.copyWith(suffix: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FieldValueCopyWith<$Res>
    implements $FieldValueCopyWith<$Res> {
  factory _$$_FieldValueCopyWith(
          _$_FieldValue value, $Res Function(_$_FieldValue) then) =
      __$$_FieldValueCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String slug,
      String type,
      String label,
      String? placeholder,
      bool? isRequired,
      List<SelectOption>? options,
      FieldValue? suffix});

  @override
  $FieldValueCopyWith<$Res>? get suffix;
}

/// @nodoc
class __$$_FieldValueCopyWithImpl<$Res>
    extends _$FieldValueCopyWithImpl<$Res, _$_FieldValue>
    implements _$$_FieldValueCopyWith<$Res> {
  __$$_FieldValueCopyWithImpl(
      _$_FieldValue _value, $Res Function(_$_FieldValue) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slug = null,
    Object? type = null,
    Object? label = null,
    Object? placeholder = freezed,
    Object? isRequired = freezed,
    Object? options = freezed,
    Object? suffix = freezed,
  }) {
    return _then(_$_FieldValue(
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      placeholder: freezed == placeholder
          ? _value.placeholder
          : placeholder // ignore: cast_nullable_to_non_nullable
              as String?,
      isRequired: freezed == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      options: freezed == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<SelectOption>?,
      suffix: freezed == suffix
          ? _value.suffix
          : suffix // ignore: cast_nullable_to_non_nullable
              as FieldValue?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FieldValue implements _FieldValue {
  _$_FieldValue(
      {required this.slug,
      required this.type,
      required this.label,
      this.placeholder,
      this.isRequired,
      final List<SelectOption>? options,
      this.suffix})
      : _options = options;

  factory _$_FieldValue.fromJson(Map<String, dynamic> json) =>
      _$$_FieldValueFromJson(json);

  @override
  final String slug;
  @override
  final String type;
  @override
  final String label;
  @override
  final String? placeholder;
  @override
  final bool? isRequired;
  final List<SelectOption>? _options;
  @override
  List<SelectOption>? get options {
    final value = _options;
    if (value == null) return null;
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final FieldValue? suffix;

  @override
  String toString() {
    return 'FieldValue(slug: $slug, type: $type, label: $label, placeholder: $placeholder, isRequired: $isRequired, options: $options, suffix: $suffix)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FieldValue &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.placeholder, placeholder) ||
                other.placeholder == placeholder) &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.suffix, suffix) || other.suffix == suffix));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, slug, type, label, placeholder,
      isRequired, const DeepCollectionEquality().hash(_options), suffix);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FieldValueCopyWith<_$_FieldValue> get copyWith =>
      __$$_FieldValueCopyWithImpl<_$_FieldValue>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FieldValueToJson(
      this,
    );
  }
}

abstract class _FieldValue implements FieldValue {
  factory _FieldValue(
      {required final String slug,
      required final String type,
      required final String label,
      final String? placeholder,
      final bool? isRequired,
      final List<SelectOption>? options,
      final FieldValue? suffix}) = _$_FieldValue;

  factory _FieldValue.fromJson(Map<String, dynamic> json) =
      _$_FieldValue.fromJson;

  @override
  String get slug;
  @override
  String get type;
  @override
  String get label;
  @override
  String? get placeholder;
  @override
  bool? get isRequired;
  @override
  List<SelectOption>? get options;
  @override
  FieldValue? get suffix;
  @override
  @JsonKey(ignore: true)
  _$$_FieldValueCopyWith<_$_FieldValue> get copyWith =>
      throw _privateConstructorUsedError;
}

SelectOption _$SelectOptionFromJson(Map<String, dynamic> json) {
  return _SelectOption.fromJson(json);
}

/// @nodoc
mixin _$SelectOption {
  String get name => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SelectOptionCopyWith<SelectOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectOptionCopyWith<$Res> {
  factory $SelectOptionCopyWith(
          SelectOption value, $Res Function(SelectOption) then) =
      _$SelectOptionCopyWithImpl<$Res, SelectOption>;
  @useResult
  $Res call({String name, String value});
}

/// @nodoc
class _$SelectOptionCopyWithImpl<$Res, $Val extends SelectOption>
    implements $SelectOptionCopyWith<$Res> {
  _$SelectOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SelectOptionCopyWith<$Res>
    implements $SelectOptionCopyWith<$Res> {
  factory _$$_SelectOptionCopyWith(
          _$_SelectOption value, $Res Function(_$_SelectOption) then) =
      __$$_SelectOptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String value});
}

/// @nodoc
class __$$_SelectOptionCopyWithImpl<$Res>
    extends _$SelectOptionCopyWithImpl<$Res, _$_SelectOption>
    implements _$$_SelectOptionCopyWith<$Res> {
  __$$_SelectOptionCopyWithImpl(
      _$_SelectOption _value, $Res Function(_$_SelectOption) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? value = null,
  }) {
    return _then(_$_SelectOption(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SelectOption implements _SelectOption {
  _$_SelectOption(this.name, this.value);

  factory _$_SelectOption.fromJson(Map<String, dynamic> json) =>
      _$$_SelectOptionFromJson(json);

  @override
  final String name;
  @override
  final String value;

  @override
  String toString() {
    return 'SelectOption(name: $name, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SelectOption &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SelectOptionCopyWith<_$_SelectOption> get copyWith =>
      __$$_SelectOptionCopyWithImpl<_$_SelectOption>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SelectOptionToJson(
      this,
    );
  }
}

abstract class _SelectOption implements SelectOption {
  factory _SelectOption(final String name, final String value) =
      _$_SelectOption;

  factory _SelectOption.fromJson(Map<String, dynamic> json) =
      _$_SelectOption.fromJson;

  @override
  String get name;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$_SelectOptionCopyWith<_$_SelectOption> get copyWith =>
      throw _privateConstructorUsedError;
}
