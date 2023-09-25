import 'package:freezed_annotation/freezed_annotation.dart';

part 'form.freezed.dart';
part 'form.g.dart';

@freezed
class FormSettings with _$FormSettings {
  factory FormSettings(String formTitle, String formDescription,
      List<FieldValue> formFields) = _FormSettings;

  factory FormSettings.fromJson(Map<String, dynamic> json) =>
      _$FormSettingsFromJson(json);
}

@freezed
class FieldValue with _$FieldValue {
  factory FieldValue({
    required String slug,
    required String type,
    required String label,
    String? placeholder,
    bool? isRequired,
    List<SelectOption>? options,
    FieldValue? suffix,
  }) = _FieldValue;

  factory FieldValue.fromJson(Map<String, dynamic> json) =>
      _$FieldValueFromJson(json);
}

@freezed
class SelectOption with _$SelectOption {
  factory SelectOption(
    String name,
    String value,
  ) = _SelectOption;

  factory SelectOption.fromJson(Map<String, dynamic> json) =>
      _$SelectOptionFromJson(json);
}
