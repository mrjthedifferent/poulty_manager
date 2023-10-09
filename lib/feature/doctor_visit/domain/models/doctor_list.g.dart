// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DoctorVisitModel _$$_DoctorVisitModelFromJson(Map<String, dynamic> json) =>
    _$_DoctorVisitModel(
      id: json['id'] as int?,
      poultryBatchId: json['poultry_batch_id'] as int?,
      doctorVisitDate: json['doctor_visit_date'] as String?,
      doctorVisitDateFormatted: json['doctor_visit_date_formatted'] as String?,
      doctorVisitCost: json['doctor_visit_cost'] as int?,
      doctorNumber: json['doctor_number'] as String?,
      doctorName: json['doctor_name'] as String?,
      doctorPhone: json['doctor_phone'] as String?,
      doctorDegree: json['doctor_degree'] as String?,
      doctorCompany: json['doctor_company'] as String?,
      doctorVisitCause: json['doctor_visit_cause'] as String?,
      doctorAdvice: json['doctor_advice'] as String?,
      doctorPrescription: json['doctor_prescription'] as String?,
    );

Map<String, dynamic> _$$_DoctorVisitModelToJson(_$_DoctorVisitModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'poultry_batch_id': instance.poultryBatchId,
      'doctor_visit_date': instance.doctorVisitDate,
      'doctor_visit_date_formatted': instance.doctorVisitDateFormatted,
      'doctor_visit_cost': instance.doctorVisitCost,
      'doctor_number': instance.doctorNumber,
      'doctor_name': instance.doctorName,
      'doctor_phone': instance.doctorPhone,
      'doctor_degree': instance.doctorDegree,
      'doctor_company': instance.doctorCompany,
      'doctor_visit_cause': instance.doctorVisitCause,
      'doctor_advice': instance.doctorAdvice,
      'doctor_prescription': instance.doctorPrescription,
    };
