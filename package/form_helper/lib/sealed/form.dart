import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_helper/Filepicker/singel_file_picker.dart';
import 'package:form_helper/sealed/form_field_template.dart';

import '../decorate.dart';
import 'validator_mixin.dart';

sealed class FormHelperField {
  final String name;
  final String title;
  final String? initialValue;
  final InputDecoration? decoration;
  final String? hint;
  final bool? isRequired;

  final FormFieldValidator<String>? validator;
  final ValueChanged<dynamic>? onChanged;

  FormHelperField(this.name,
      {required this.title,
      this.initialValue,
      this.decoration,
      this.isRequired,
      this.hint,
      this.validator,
      this.onChanged});
}

class FormHelperTextField extends FormHelperField
    with FormHelperFieldValidatorMixin {
  final int? maxLine;
  FormHelperTextField(super.name,
      {required super.title,
      super.initialValue,
      super.decoration,
      super.hint,
      this.maxLine,
      super.isRequired,
      super.validator,
      super.onChanged});

  Widget get toWidget {
    return FormFieldTemplate(
        title: title,
        child: FormBuilderTextField(
          name: name,
          initialValue: initialValue,
          maxLines: maxLine,
          // validator is required

          decoration:
              decoration ?? FormDecoration.outline.copyWith(hintText: hint),
          validator: validate,
          onChanged: onChanged,
        ));
  }

  @override
  String? validate(String? value) {
    if (isRequired == true) {
      return validateRequired(value);
    }

    // if any validator is provided
    if (validator != null) {
      return validator!(value);
    }
    // if no validator is provided
    return null;
  }
}

class FormHelperDropDown<T> extends FormHelperField
    with FormHelperFieldValidatorMixin {
  final dynamic options;
  FormHelperDropDown(super.name,
      {required super.title,
      required this.options,
      super.initialValue,
      super.decoration,
      super.hint,
      super.isRequired,
      super.validator,
      super.onChanged});

  Widget get toWidget {
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
    }

    return FormFieldTemplate(
      title: title,
      child: FormBuilderDropdown(
        name: name,
        initialValue: initialValue,
        decoration:
            decoration ?? FormDecoration.outline.copyWith(hintText: hint),
        validator: validator,
        onChanged: onChanged,
        items: items,
      ),
    );
  }

  @override
  String? validate(String? value) {
    if (isRequired == true) {
      return validateRequired(value);
    }

    // if any validator is provided
    if (validator != null) {
      return validator!(value);
    }
    // if no validator is provided
    return null;
  }
}

// Make a custom Field for date picker only not for time picker

class FormHelperDatePicker extends FormHelperField
    with FormHelperFieldValidatorMixin {
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateTime? currentDate;
  final DatePickerEntryMode initialEntryMode;

  FormHelperDatePicker(
    super.name, {
    required super.title,
    this.firstDate,
    this.lastDate,
    this.currentDate,
    this.initialEntryMode = DatePickerEntryMode.calendarOnly,
    super.initialValue,
    super.decoration,
    super.hint,
    super.isRequired,
    super.validator,
    super.onChanged,
  });

  Widget get toWidget {
    return FormFieldTemplate(
      title: title,
      child: FormBuilderDateTimePicker(
        name: name,
        initialValue: currentDate,
        firstDate: firstDate,
        lastDate: lastDate,
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        timePickerInitialEntryMode: TimePickerEntryMode.input,
        decoration:
            decoration ?? FormDecoration.outline.copyWith(hintText: hint),
        validator: (val) => validate(
          val?.toString(),
        ),
        onChanged: onChanged,
      ),
    );
  }

  @override
  String? validate(String? value) {
    if (isRequired == true) {
      return validateRequired(value);
    }

    // if any validator is provided
    if (validator != null) {
      return validator!(value);
    }
    // if no validator is provided
    return null;
  }
}

class FormHelperSingleFilePicker extends FormHelperField {
  FormHelperSingleFilePicker(super.name, {required super.title});

  Widget get toWidget {
    return FormFieldTemplate(
      title: title,
      child: SingleFilePicker(
        name: name,
        decoration:
            decoration ?? FormDecoration.outline.copyWith(hintText: hint),
        onChanged: onChanged,
        previewImages: true,
        allowMultiple: false,
      ),
    );
  }
}
