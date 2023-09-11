import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_helper/decorate.dart';

class FormFields {
  static Widget textField(
    String name, {
    required String title,
    String? initialValue,
    InputDecoration? decoration,
    FormFieldValidator<String>? validator,
    ValueChanged<String?>? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Text(title),
        const SizedBox(
          height: 5,
        ),
        FormBuilderTextField(
          name: name,
          initialValue: initialValue,
          decoration: decoration ?? FormDecoration.outline,
          validator: validator,
          onChanged: onChanged,
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }

  static Widget dropDown(
    String name, {
    required String title,
    required dynamic options,
    String? initialValue,
    InputDecoration? decoration,
    ValueChanged<dynamic>? onChanged,
  }) {
    List<DropdownMenuItem<String>> items = [];

    if (options is List<String>) {
      items = options
          .map(
            (e) => DropdownMenuItem(
              value: e,
              child: Text(e),
            ),
          )
          .toList();
    } else if (options is Map<String, String>) {
      items = options.keys
          .map(
            (e) => DropdownMenuItem(
              value: options[e],
              child: Text(e),
            ),
          )
          .toList();
    } else {
      debugPrint('${options.runtimeType} is not a valid type');
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Text(title),
        const SizedBox(
          height: 5,
        ),
        FormBuilderDropdown(
          name: name,
          initialValue: initialValue,
          decoration: decoration ?? FormDecoration.outline,
          items: items,
          onChanged: onChanged,
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }

  // make a datepicker

  // make a timepicker range from and to

  // make a file picker,
  //
}
