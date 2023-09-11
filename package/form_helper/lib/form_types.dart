import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_helper/decorate.dart';

class FormFields {
  static Widget textField(
    String name, {
    String? initialValue,
    InputDecoration? decoration,
    FormFieldValidator<String>? validator,
    ValueChanged<String?>? onChanged,
  }) {
    return FormBuilderTextField(
      name: name,
      initialValue: initialValue,
      decoration: decoration ?? FormDecoration.outline,
      validator: validator,
      onChanged: onChanged,
    );
  }

  static Widget dropDown(
    String name, {
    required dynamic options,
    String? initialValue,
    InputDecoration? decoration,
    ValueChanged<dynamic>? onChanged,
  }) {
    final items = switch (options.runtimeType) {
      (List<String> l) => l
          .map(
            (e) => DropdownMenuItem(
              value: e,
              child: Text(e),
            ),
          )
          .toList(),
      (Map<String, dynamic> r) => r.keys
          .map(
            (e) => DropdownMenuItem(
              value: r[e],
              child: Text(e),
            ),
          )
          .toList(),
      _ => options
          .map(
            (e) => DropdownMenuItem(
              value: e,
              child: Text(e),
            ),
          )
          .toList()
    };

    return FormBuilderDropdown(
      name: name,
      initialValue: initialValue,
      decoration: decoration ?? FormDecoration.outline,
      items: items,
      onChanged: onChanged,
    );
  }
}
