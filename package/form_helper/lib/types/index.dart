import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

typedef FieldArg = FormBuilderField<dynamic> Function(
  String name,
  Widget Function(FormFieldState<dynamic>) builder, {
  Key? key,
  void Function(dynamic)? onSaved,
  dynamic initialValue,
  AutovalidateMode? autovalidateMode,
  bool? enabled,
  String? Function(dynamic)? validator,
  String? restorationId,
  dynamic Function(dynamic)? valueTransformer,
  void Function(dynamic)? onChanged,
  void Function()? onReset,
  FocusNode? focusNode,
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
