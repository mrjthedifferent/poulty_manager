import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_helper/types/index.dart';

({
  FormBuilderFunc form,
  void Function(void Function(Map<String, dynamic>) onSubmit) handleSubmit,
  void Function() handleReset,
  FieldArg register
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

  FormBuilderField register(
      String name, Widget Function(FormFieldState<dynamic>) builder,
      {Key? key,
      void Function(dynamic)? onSaved,
      dynamic initialValue,
      AutovalidateMode? autovalidateMode,
      bool? enabled,
      String? Function(dynamic)? validator,
      String? restorationId,
      dynamic Function(dynamic)? valueTransformer,
      void Function(dynamic)? onChanged,
      void Function()? onReset,
      FocusNode? focusNode}) {
    return FormBuilderField(
        key: key,
        onSaved: onSaved,
        initialValue: initialValue,
        autovalidateMode: autovalidateMode,
        enabled: enabled ?? true,
        validator: validator,
        restorationId: restorationId,
        valueTransformer: valueTransformer,
        onChanged: onChanged,
        onReset: onReset,
        focusNode: focusNode,
        builder: builder,
        name: name);
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
    register: register
  );
}
