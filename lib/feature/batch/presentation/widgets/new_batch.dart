import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_helper/form_helper.dart';
import 'package:styled_widget/styled_widget.dart';

class NewBatch extends HookWidget {
  const NewBatch({super.key});

  @override
  Widget build(BuildContext context) {
    final (:form, :handleSubmit, :handleReset) = useFormBuilder();
    return ListView(
      children: [
        form(
          [Styled.text("nj")].toColumn(),
        )
      ],
    );
  }
}
