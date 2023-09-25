import 'package:freezed_annotation/freezed_annotation.dart';

part 'firm_model.freezed.dart';
part 'firm_model.g.dart';

@freezed
class FirmModel with _$FirmModel {
  factory FirmModel({
    required int id,
    String? ownerId,
    required String name,
    bool? isApproved,
    bool? isActive,
    String? logo,
    String? banner,
    List<String>? gallery,
    String? phone,
    String? email,
    String? address,
    String? about,
  }) = _FirmModel;

  factory FirmModel.fromJson(Map<String, dynamic> json) =>
      _$FirmModelFromJson(json);
}
