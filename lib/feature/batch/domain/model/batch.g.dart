// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ModelBatch _$$_ModelBatchFromJson(Map<String, dynamic> json) =>
    _$_ModelBatch(
      id: json['id'] as int,
      ownerId: json['owner_id'] as int,
      poultryFirmId: json['poultry_firm_id'] as int,
      poultryNameId: json['poultry_name_id'] as int,
      poultryName: json['poultry_name'] as String,
      poultryTypeId: json['poultry_type_id'] as int,
      poultryType: json['poultry_type'] as String?,
      manufactureTypeId: json['manufacture_type_id'] as int?,
      manufactureType: json['manufacture_type'] as String?,
      hatchDate: json['hatch_date'] as String?,
      hatchDateFormatted: json['hatch_date_formatted'] as String?,
      chickQuantity: json['chick_quantity'] as int? ?? 0,
      freeChickQuantity: json['free_chick_quantity'] as int? ?? 0,
      chickPrice: json['chick_price'] as int? ?? 0,
      discount: json['discount'] as int? ?? 0,
      chickCompany: json['chick_company'] as String? ?? "No value",
      dealerPhone: json['dealer_phone'] as String? ?? "No value",
      dealerName: json['dealer_name'] as String? ?? "",
      shopAddress: json['shop_address'] as String? ?? "",
      transactionType: json['transaction_type'] as String? ?? "",
      transactionVoucher: json['transaction_voucher'],
    );

Map<String, dynamic> _$$_ModelBatchToJson(_$_ModelBatch instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner_id': instance.ownerId,
      'poultry_firm_id': instance.poultryFirmId,
      'poultry_name_id': instance.poultryNameId,
      'poultry_name': instance.poultryName,
      'poultry_type_id': instance.poultryTypeId,
      'poultry_type': instance.poultryType,
      'manufacture_type_id': instance.manufactureTypeId,
      'manufacture_type': instance.manufactureType,
      'hatch_date': instance.hatchDate,
      'hatch_date_formatted': instance.hatchDateFormatted,
      'chick_quantity': instance.chickQuantity,
      'free_chick_quantity': instance.freeChickQuantity,
      'chick_price': instance.chickPrice,
      'discount': instance.discount,
      'chick_company': instance.chickCompany,
      'dealer_phone': instance.dealerPhone,
      'dealer_name': instance.dealerName,
      'shop_address': instance.shopAddress,
      'transaction_type': instance.transactionType,
      'transaction_voucher': instance.transactionVoucher,
    };

_$_ModelShowLabel _$$_ModelShowLabelFromJson(Map<String, dynamic> json) =>
    _$_ModelShowLabel(
      label: json['label'] as String,
      value: json['value'] as String,
      type: json['type'] as String? ?? "text",
    );

Map<String, dynamic> _$$_ModelShowLabelToJson(_$_ModelShowLabel instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
      'type': instance.type,
    };

_$_ModelBatchDetails _$$_ModelBatchDetailsFromJson(Map<String, dynamic> json) =>
    _$_ModelBatchDetails(
      resource: ModelBatch.fromJson(json['resource'] as Map<String, dynamic>),
      show: (json['show'] as List<dynamic>?)
              ?.map((e) => ModelShowLabel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ModelBatchDetailsToJson(
        _$_ModelBatchDetails instance) =>
    <String, dynamic>{
      'resource': instance.resource.toJson(),
      'show': instance.show.map((e) => e.toJson()).toList(),
    };
