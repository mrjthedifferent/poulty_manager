import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

typedef FieldArg = Widget Function(
  String name, {
  String? Function(String?)? validator,
  InputDecoration? decoration,
  void Function(String?)? onChanged,
  dynamic Function(String?)? valueTransformer,
  bool enabled,
  void Function(String?)? onSaved,
  void Function()? onReset,
});

typedef FormBuilderFunc = FormBuilder Function(
  Widget child, {
  void Function()? onChanged,
  AutovalidateMode? autovalidateMode,
  Future<bool> Function()? onWillPop,
  Map<String, dynamic> initialValue,
  bool skipDisabled,
  bool enabled,
  bool clearValueOnUnregister,
});
