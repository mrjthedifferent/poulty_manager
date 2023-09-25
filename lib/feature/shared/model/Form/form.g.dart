// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FormSettings _$$_FormSettingsFromJson(Map<String, dynamic> json) =>
    _$_FormSettings(
      json['form_title'] as String,
      json['form_description'] as String,
      (json['form_fields'] as List<dynamic>)
          .map((e) => FieldValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_FormSettingsToJson(_$_FormSettings instance) =>
    <String, dynamic>{
      'form_title': instance.formTitle,
      'form_description': instance.formDescription,
      'form_fields': instance.formFields.map((e) => e.toJson()).toList(),
    };

_$_FieldValue _$$_FieldValueFromJson(Map<String, dynamic> json) =>
    _$_FieldValue(
      slug: json['slug'] as String,
      type: json['type'] as String,
      label: json['label'] as String,
      placeholder: json['placeholder'] as String?,
      isRequired: json['is_required'] as bool?,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => SelectOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      suffix: json['suffix'] == null
          ? null
          : FieldValue.fromJson(json['suffix'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FieldValueToJson(_$_FieldValue instance) =>
    <String, dynamic>{
      'slug': instance.slug,
      'type': instance.type,
      'label': instance.label,
      'placeholder': instance.placeholder,
      'is_required': instance.isRequired,
      'options': instance.options?.map((e) => e.toJson()).toList(),
      'suffix': instance.suffix?.toJson(),
    };

_$_SelectOption _$$_SelectOptionFromJson(Map<String, dynamic> json) =>
    _$_SelectOption(
      json['name'] as String,
      json['value'] as String,
    );

Map<String, dynamic> _$$_SelectOptionToJson(_$_SelectOption instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };
