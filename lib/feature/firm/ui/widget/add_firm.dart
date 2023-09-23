// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:form_helper/form_helper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddFirmField extends HookConsumerWidget {
  final void Function(Map<String, dynamic>) onSubmit;
  final Map<String, dynamic>? initialData;
  const AddFirmField({
    super.key,
    this.initialData,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MakeForm(
      fields: [
        // name, phone, email, address,about,logo, cover
        FormHelperTextField("name", title: "Enter Name", isRequired: true),
        FormHelperTextField("phone", title: "Enter Phone"),
        FormHelperTextField("email", title: "Enter Email"),
        FormHelperTextField("address", title: "Enter Address", maxLine: 3),
        FormHelperTextField("about", title: "Enter About", maxLine: 3),
        FormHelperSingleFilePicker("logo", title: "Select Logo"),
        FormHelperSingleFilePicker("banner", title: "Select banner"),
        FormHelperMultiFilePicker("gallery", title: "Select Gallery (Max 5)"),
      ],
      onSubmit: onSubmit,
    );
  }
}
