import 'package:freezed_annotation/freezed_annotation.dart';

part 'firm_model.freezed.dart';
part 'firm_model.g.dart';

@freezed
@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class FirmModel with _$FirmModel {
  factory FirmModel({
    required int id,
    String? ownerId,
    String? name,
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

  factory FirmModel.fromMap(Map<String, dynamic> json) {
    return _$FirmModelFromJson(json);
  }

  Map<String, dynamic> toMap() {
    return _$FirmModelToJson(this);
  }
}
