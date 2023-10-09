import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_list.freezed.dart';
part 'doctor_list.g.dart';

@freezed
class DoctorVisitModel with _$DoctorVisitModel {
  factory DoctorVisitModel({
    int? id,
    int? poultryBatchId,
    String? doctorVisitDate,
    String? doctorVisitDateFormatted,
    int? doctorVisitCost,
    String? doctorNumber,
    String? doctorName,
    String? doctorPhone,
    String? doctorDegree,
    String? doctorCompany,
    String? doctorVisitCause,
    String? doctorAdvice,
    String? doctorPrescription,
  }) = _DoctorVisitModel;

  factory DoctorVisitModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorVisitModelFromJson(json);
}
