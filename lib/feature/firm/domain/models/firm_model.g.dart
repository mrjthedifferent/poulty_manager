// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firm_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirmModel _$FirmModelFromJson(Map<String, dynamic> json) => FirmModel(
      id: json['id'] as int,
      ownerId: json['owner_id'] as String?,
      name: json['name'] as String?,
      isApproved: json['is_approved'] as bool?,
      isActive: json['is_active'] as bool?,
      logo: json['logo'] as String?,
      banner: json['banner'] as String?,
      gallery:
          (json['gallery'] as List<dynamic>?)?.map((e) => e as String).toList(),
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      about: json['about'] as String?,
    );

Map<String, dynamic> _$FirmModelToJson(FirmModel instance) => <String, dynamic>{
      'id': instance.id,
      'owner_id': instance.ownerId,
      'name': instance.name,
      'is_approved': instance.isApproved,
      'is_active': instance.isActive,
      'logo': instance.logo,
      'banner': instance.banner,
      'gallery': instance.gallery,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
      'about': instance.about,
    };
