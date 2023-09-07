import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_helper/decorate.dart';

({
  FormBuilder Function(
    Widget child, {
    void Function()? onChanged,
    AutovalidateMode? autovalidateMode,
    Future<bool> Function()? onWillPop,
    Map<String, dynamic> initialValue,
    bool skipDisabled,
    bool enabled,
    bool clearValueOnUnregister,
  }) form,
  void Function(void Function(Map<String, dynamic>) onSubmit) handleSubmit,
  void Function() handleReset,
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
      {required String name,
      String? Function(String?)? validator,
      InputDecoration? decoration,
      void Function(String?)? onChanged,
      dynamic Function(String?)? valueTransformer,
      bool enabled = true,
      void Function(String?)? onSaved,
      AutovalidateMode? autovalidateMode = AutovalidateMode.disabled,
      void Function()? onReset,
      FocusNode? focusNode,
      String? restorationId,
      String? initialValue,
      bool readOnly = false,
      int? maxLines = 1,
      bool obscureText = false,
      TextCapitalization textCapitalization = TextCapitalization.none,
      EdgeInsets scrollPadding = const EdgeInsets.all(20.0),
      bool enableInteractiveSelection = true,
      TextAlign textAlign = TextAlign.start,
      bool autofocus = false,
      bool autocorrect = true,
      double cursorWidth = 2.0,
      double? cursorHeight,
      TextInputType? keyboardType,
      TextStyle? style,
      TextEditingController? controller,
      TextInputAction? textInputAction,
      StrutStyle? strutStyle,
      TextDirection? textDirection,
      int? maxLength,
      void Function()? onEditingComplete,
      void Function(String?)? onSubmitted,
      Radius? cursorRadius,
      Color? cursorColor,
      Brightness? keyboardAppearance,
      Widget? Function(BuildContext,
              {required int currentLength,
              required bool isFocused,
              required int? maxLength})?
          buildCounter,
      bool expands = false,
      int? minLines,
      bool? showCursor,
      void Function()? onTap,
      void Function(PointerDownEvent)? onTapOutside,
      bool enableSuggestions = false,
      TextAlignVertical? textAlignVertical,
      ScrollController? scrollController,
      ScrollPhysics? scrollPhysics,
      SmartDashesType? smartDashesType,
      SmartQuotesType? smartQuotesType,
      Iterable<String>? autofillHints,
      String obscuringCharacter = '•',
      MouseCursor? mouseCursor,
      TextMagnifierConfiguration? magnifierConfiguration,
      ContentInsertionConfiguration? contentInsertionConfiguration}) {
    return FormBuilderTextField(
      name: name,
      decoration: decoration ?? FormDecoration.outline(),
      onChanged: onChanged,
      validator: validator,
      valueTransformer: valueTransformer,
      enabled: enabled,
      onSaved: onSaved,
      autovalidateMode: autovalidateMode,
      onReset: onReset,
      focusNode: focusNode,
      restorationId: restorationId,
      initialValue: initialValue,
      readOnly: readOnly,
      maxLines: maxLines,
      obscureText: obscureText,
      textCapitalization: textCapitalization,
      scrollPadding: scrollPadding,
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
  );
}
