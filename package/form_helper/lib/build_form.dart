import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_helper/decorate.dart';
import 'package:form_helper/types/index.dart';

({
  FormBuilderFunc form,
  void Function(void Function(Map<String, dynamic>) onSubmit) handleSubmit,
  void Function() handleReset,
  FieldArg registerTextField
}) useFormBuilder({
  GlobalKey<FormBuilderState>? fKey,
}) {
  final formKey = fKey ?? GlobalKey<FormBuilderState>();

  void handleSubmit(void Function(Map<String, dynamic> formValue) onSubmit) {
    if (formKey.currentState!.saveAndValidate()) {
      onSubmit(formKey.currentState!.value);
    }
  }

  void handleReset() {
    formKey.currentState!.reset();
  }

  Widget registerTextField(
    String name, {
    String? Function(String?)? validator,
    InputDecoration? decoration,
    void Function(String?)? onChanged,
    dynamic Function(String?)? valueTransformer,
    bool enabled = true,
    void Function(String?)? onSaved,
    void Function()? onReset,
  }) {
    return FormBuilderTextField(
      name: name,
      decoration: decoration ?? FormDecoration.outline,
      onChanged: onChanged,
      validator: validator,
      valueTransformer: valueTransformer,
      enabled: enabled,
      onSaved: onSaved,
      onReset: onReset,
    );
  }

  FormBuilder builder(
    Widget child, {
    void Function()? onChanged,
    AutovalidateMode? autovalidateMode,
    Future<bool> Function()? onWillPop,
    Map<String, dynamic> initialValue = const <String, dynamic>{},
    bool skipDisabled = false,
    bool enabled = true,
    bool clearValueOnUnregister = false,
  }) {
    return FormBuilder(
      key: formKey,
      onChanged: onChanged,
      autovalidateMode: autovalidateMode,
      onWillPop: onWillPop,
      initialValue: initialValue,
      skipDisabled: skipDisabled,
      enabled: enabled,
      clearValueOnUnregister: clearValueOnUnregister,
      child: child,
    );
  }

  return (
    form: builder,
    handleSubmit: handleSubmit,
    handleReset: handleReset,
    registerTextField: registerTextField
  );
}
