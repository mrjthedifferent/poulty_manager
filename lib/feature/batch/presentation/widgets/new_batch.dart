import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_helper/form_helper.dart';
import 'package:styled_widget/styled_widget.dart';

class NewBatch extends HookWidget {
  const NewBatch({super.key});

  @override
  Widget build(BuildContext context) {
    final (:form, :handleSubmit, :handleReset, :registerTextField) =
        useFormBuilder();
    return ListView(
      children: [
        form(
          [
            registerTextField(
              'user',
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            registerTextField('pass'),
            Styled.text('Submit')
                .padding(all: 4)
                .decorated(color: Colors.orange)
                .gestures(onTap: () {
              handleSubmit((fval) {
                debugPrint(fval.toString());
                handleReset();
              });
            })
          ].toColumn().padding(all: 10),
        )
      ],
    );
  }
}
