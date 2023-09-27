import 'package:freezed_annotation/freezed_annotation.dart';

part 'batch.freezed.dart';
part 'batch.g.dart';

@freezed
class ModelBatch with _$ModelBatch {
  factory ModelBatch({
    required int id,
    required int ownerId,
    required int poultryFirmId,
    required int poultryNameId,
    required String poultryName,
    required int poultryTypeId,
    String? poultryType,
    int? manufactureTypeId,
    String? manufactureType,
    String? hatchDate,
    String? hatchDateFormatted,
    @Default(0) int chickQuantity,
    @Default(0) int freeChickQuantity,
    @Default(0) int chickPrice,
    @Default(0) int discount,
    @Default("No value") String chickCompany,
    @Default("No value") String dealerPhone,
    @Default("") String dealerName,
    @Default("") String shopAddress,
    @Default("") String transactionType,
    dynamic transactionVoucher,
    required String totalAliveChicks,
    required String avgWeight,
    required String manufactureCostKg,
    required String totalCost,
  }) = _ModelBatch;

  factory ModelBatch.fromJson(Map<String, dynamic> json) =>
      _$ModelBatchFromJson(json);
}

@freezed
class ModelShowLabel with _$ModelShowLabel {
  factory ModelShowLabel(
      {required String label,
      required String value,
      @Default("text") String type}) = _ModelShowLabel;

  factory ModelShowLabel.fromJson(Map<String, dynamic> json) =>
      _$ModelShowLabelFromJson(json);
}

@freezed
class ModelBatchDetails with _$ModelBatchDetails {
  factory ModelBatchDetails({
    required ModelBatch resource,
    @Default([]) List<ModelShowLabel> show,
  }) = _ModelBatchDetails;

  factory ModelBatchDetails.fromJson(Map<String, dynamic> json) =>
      _$ModelBatchDetailsFromJson(json);
}
