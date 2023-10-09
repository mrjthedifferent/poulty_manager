// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
// ignore: depend_on_referenced_packages
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:form_helper/form_helper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '/core/style/style.dart';
import '/feature/shared/components/mutation_handler.dart';
import '/feature/shared/model/Form/form.dart';
import '../../../core/hooks/request/get_client.dart';

List<FormHelperField> fromResponseToFormHelper(List<FieldValue> fields) {
  return fields.map((e) {
    final field = switch (e.type) {
      'dropdown' => FormHelperDropDown(
          e.slug,
          title: e.label,
          hint: e.placeholder,
          options: e.options!.fold(
            <String, String>{},
            (previousValue, element) {
              previousValue[element.name] = element.value;
              return previousValue;
            },
          ),
        ),
      'date' => FormHelperDatePicker(e.slug, title: e.label),
      'radio' || 'checkbox' => FormHelperRadio(
          e.slug,
          title: e.label,
          option: e.options!.fold(
            <String, String>{},
            (previousValue, element) {
              previousValue[element.name] = element.value;
              return previousValue;
            },
          ),
        ),
      'file' => FormHelperSingleFilePicker(
          e.slug,
          title: e.label,
        ),
      'time_range' => FormHelperTimeOfDayRangePicker(
          e.slug,
          title: e.label,
        ),
      'number' => e.suffix != null
          ? FormHelperTextFieldWithSuffixDropdown(
              e.slug,
              title: e.label,
              keyboardType: TextInputType.number,
              suffixFieldName: e.suffix!.slug,
              suffixHint: e.suffix!.label,
              options: e.suffix!.options!.fold(
                <String, String>{},
                (previousValue, element) {
                  previousValue[element.name] = element.value;
                  return previousValue;
                },
              ),
            )
          : FormHelperTextField(
              e.slug,
              title: e.label,
              keyboardType: TextInputType.number,
              hint: e.placeholder,
              isRequired: e.isRequired,
            ),
      'text' => e.suffix != null
          ? FormHelperTextFieldWithSuffixDropdown(
              e.slug,
              title: e.label,
              suffixFieldName: e.suffix!.slug,
              suffixHint: e.suffix!.label,
              options: e.suffix!.options!.fold(
                <String, String>{},
                (previousValue, element) {
                  previousValue[element.name] = element.value;
                  return previousValue;
                },
              ),
            )
          : FormHelperTextField(
              e.slug,
              title: e.label,
              hint: e.placeholder,
              isRequired: e.isRequired,
            ),
      _ => FormHelperTextField(
          e.slug,
          title: e.label,
          hint: e.placeholder,
          isRequired: e.isRequired,
        ),
    };

    return field as FormHelperField;
  }).toList();
}

FormData getFormData(Map<String, dynamic> data) {
  final formData = FormData();

  data.forEach((key, value) {
    if (value is List) {
      for (var i = 0; i < value.length; i++) {
        final element = value[i];
        if (element is PlatformFile) {
          formData.files.add(
            MapEntry(
              "$key[$i]",
              MultipartFile.fromFileSync(
                element.path!,
                filename: element.name,
              ),
            ),
          );
        }
      }
    } else {
      if (value is PlatformFile) {
        formData.files.add(
          MapEntry(
            key,
            MultipartFile.fromFileSync(
              value.path!,
              filename: value.name,
            ),
          ),
        );
      } else {
        formData.fields.add(
          MapEntry(key, value ?? ""),
        );
      }
    }
  });
  return formData;
}

({Map<String, dynamic> data, bool isContainFile}) serializeFormData(
    Map<String, dynamic> formData) {
  bool isContainFile = false;
  final data = formData.map((key, value) {
    if (value is DateTime) {
      return MapEntry(key, value.toString());
    }
    if (value is PlatformFile) {
      isContainFile = true;
      return MapEntry(key, value);
    }
    if (value is List) {
      value.any((element) => element is PlatformFile)
          ? isContainFile = true
          : null;
    }
    return MapEntry(key, value);
  });
  return (data: data, isContainFile: isContainFile);
}

String makeSnakeToSentenceCase(String str) {
  return str.replaceAllMapped(
      RegExp(r'([A-Z])'), (Match match) => ' ${match[0]}');
}

class RenderFormAndUpdate extends HookConsumerWidget {
  final FormSettings formSettings;
  final String requestUrl;
  final Map<String, dynamic> Function(Map<String, dynamic>)? requestTransformer;
  final String method;
  final void Function(dynamic)? onSuccess;

  const RenderFormAndUpdate({
    super.key,
    required this.formSettings,
    required this.requestUrl,
    this.requestTransformer,
    this.method = 'POST',
    this.onSuccess,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final handleSubmission =
        useRequestHandler(ref.watch(requestHandlerProvider));
    return MutationHandler(
      value: handleSubmission.status,
      success: (data) {
        if (data is Map<String, dynamic>) {
          return data.keys
              .map(
                  (e) => dataShowItem(makeSnakeToSentenceCase(e), "${data[e]}"))
              .toList()
              .toColumn()
              .padding(all: 20)
              .scrollable();
        }
        return Styled.text(data.toString()).center().padding(all: 20);
      },
      initial: () => SingleChildScrollView(
        child: MakeForm(
          fields: fromResponseToFormHelper(formSettings.formFields),
          onSubmit: (formData) {
            final fdata = requestTransformer != null
                ? requestTransformer!(formData)
                : formData;

            debugPrint(fdata.toString());
            final (:data, :isContainFile) = serializeFormData(fdata);

            final formSubmitData = isContainFile ? getFormData(data) : data;

            handleSubmission.trigger(requestUrl,
                method: method,
                hasFile: isContainFile,
                data: formSubmitData,
                onSuccess: onSuccess);
          },
        ).padding(all: 20),
      ),
    );
  }
}
