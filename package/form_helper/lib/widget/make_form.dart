import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_helper/sealed/form_sealed.dart';

import '../build_form.dart';

class MakeForm extends StatelessWidget {
  final List<FormHelperField> fields;
  final void Function(Map<String, dynamic> formValues) onSubmit;
  final void Function()? onCancel;
  MakeForm(
      {super.key, required this.fields, required this.onSubmit, this.onCancel});
  final fbkey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final (:form, :handleSubmit, :handleReset, :register) =
        useFormBuilder(fKey: fbkey);
    return form(
      Column(
        children: [
          ...fields.map((field) => field.toWidget).toList(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                onPressed: () {
                  final isValid = handleSubmit(onSubmit);
                  if (!isValid) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please fill all required fields")));
                  } else {
                    handleReset();
                  }
                },
                child: const Text(
                  "সংরক্ষন করুন",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              // Make a cancel button outline
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      side: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                onPressed: onCancel,
                child: const Text("বাতিল করুন"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
