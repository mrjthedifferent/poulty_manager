import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_helper/file_picker_field/single_file_picker.dart';
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

  Widget get toWidget;

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
  final bool noTitleApply;
  final int? maxLine;
  final Widget? suffix;
  final bool obscureText;
  FormHelperTextField(super.name,
      {required super.title,
      this.suffix,
      super.initialValue,
      super.decoration,
      super.hint,
      this.maxLine,
      this.obscureText = false,
      this.noTitleApply = false,
      super.isRequired,
      super.validator,
      super.onChanged});

  @override
  Widget get toWidget {
    if (noTitleApply) {
      return FormBuilderTextField(
        obscureText: obscureText,
        name: name,
        initialValue: initialValue,
        maxLines: maxLine,
        decoration: decoration ??
            FormDecoration.outline.copyWith(hintText: hint, suffix: suffix),
        validator: validate,
        onChanged: onChanged,
      );
    }
    return FormFieldTemplate(
      title: title,
      child: FormBuilderTextField(
        name: name,
        initialValue: initialValue,
        maxLines: maxLine,

        // validator is required

        decoration: decoration ??
            FormDecoration.outline.copyWith(hintText: hint, suffix: suffix),
        validator: validate,
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

class FormHelperDropDown extends FormHelperField
    with FormHelperFieldValidatorMixin {
  final Map<String, String> options;
  FormHelperDropDown(super.name,
      {required super.title,
      required this.options,
      super.initialValue,
      super.decoration,
      super.hint,
      super.isRequired,
      super.validator,
      super.onChanged});

  @override
  Widget get toWidget {
    List<DropdownMenuItem<String>> items = [];

    items = options.keys
        .map(
          (e) => DropdownMenuItem(
            value: options[e],
            child: Text(e),
          ),
        )
        .toList();

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
  final InputType inputType;

  FormHelperDatePicker(
    super.name, {
    required super.title,
    this.firstDate,
    this.lastDate,
    this.currentDate,
    this.inputType = InputType.date,
    this.initialEntryMode = DatePickerEntryMode.calendarOnly,
    super.initialValue,
    super.decoration,
    super.hint,
    super.isRequired,
    super.validator,
    super.onChanged,
  });

  @override
  Widget get toWidget {
    return FormFieldTemplate(
      title: title,
      child: FormBuilderDateTimePicker(
        name: name,
        inputType: inputType,
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

  @override
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

class FormHelperTextFieldWithSuffixDropdown extends FormHelperField {
  final Map<String, String> options;
  final String suffixFieldName;
  final String suffixHint;
  FormHelperTextFieldWithSuffixDropdown(
    super.name, {
    required super.title,
    required this.options,
    required this.suffixFieldName,
    required this.suffixHint,
    super.initialValue,
  });

  @override
  Widget get toWidget {
    return FormFieldTemplate(
      title: title,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: FormBuilderTextField(
                  name: name,
                  initialValue: initialValue,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hint,
                  ),
                  onChanged: onChanged,
                ),
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              flex: 1,
              child: FormBuilderDropdown(
                name: suffixFieldName,
                decoration: decoration ??
                    FormDecoration.outline.copyWith(
                      hintText: suffixHint,
                      border: InputBorder.none,
                      isDense: true,
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 16,
                      ),
                    ),
                onChanged: onChanged,
                items: options.keys
                    .map(
                      (e) => DropdownMenuItem(
                        value: options[e],
                        child: Text(e),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FormHelperTimeOfDayRangePicker extends FormHelperField {
  FormHelperTimeOfDayRangePicker(super.name,
      {required super.title,
      super.initialValue,
      super.decoration,
      super.hint,
      super.isRequired,
      super.validator,
      super.onChanged});

  @override
  Widget get toWidget => FormFieldTemplate(
        title: title,
        child: Row(
          children: [
            Expanded(
              child: FormBuilderDateTimePicker(
                name: "${name}_start",
                inputType: InputType.time,
                decoration: FormDecoration.outline.copyWith(
                  hintText: "Start Time",
                ),
                initialTime: const TimeOfDay(hour: 8, minute: 0),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: FormBuilderDateTimePicker(
                name: "${name}_end",
                inputType: InputType.time,
                decoration: FormDecoration.outline.copyWith(
                  hintText: "End Time",
                ),
                initialTime: const TimeOfDay(hour: 8, minute: 0),
              ),
            ),
          ],
        ),
      );
}

class FormHelperRadio extends FormHelperField {
  final Map<String, String> option;
  FormHelperRadio(super.name, {required super.title, required this.option});

  @override
  Widget get toWidget => FormFieldTemplate(
        title: title,
        child: FormBuilderChoiceChip(
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          name: name,
          spacing: 20,
          options: option.keys
              .map((e) => FormBuilderChipOption(
                    value: e,
                    child: Text("${option[e]}"),
                  ))
              .toList(),
        ),
      );
}

class FormHelperCustomField extends FormHelperField {
  FormHelperCustomField(super.name,
      {required super.title,
      required this.builder,
      super.decoration,
      super.hint,
      super.initialValue,
      super.validator,
      super.isRequired,
      super.onChanged});

  final Widget Function(FormFieldState<dynamic>) builder;

  @override
  Widget get toWidget => FormBuilderField(
        builder: builder,
        name: name,
        initialValue: initialValue,
        validator: validator,
        onChanged: onChanged,
      );
}
