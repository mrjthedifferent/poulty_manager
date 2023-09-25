import 'package:freezed_annotation/freezed_annotation.dart';

part 'form.freezed.dart';
part 'form.g.dart';

@freezed
class FormModel with _$FormModel {
  factory FormModel(
    String name,
    String formTitle,
  ) = _FormModel;

  factory FormModel.fromJson(Map<String, dynamic> json) =>
      _$FormModelFromJson(json);
}
