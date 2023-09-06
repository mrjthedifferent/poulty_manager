import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart';
import 'package:poulty_manager/core/form/dropdown.dart';
import 'package:styled_widget/styled_widget.dart';

class NewBatch extends HookWidget {
  const NewBatch({super.key});

  @override
  Widget build(BuildContext context) {
    final (register, select) = useDropdownFormField(
      null,
      items: Either.left(
        ['Apple', 'Orange', 'Mango'],
      ),
    );
    return ListView(
      children: [
        Form(
          child: [
            Container(),
            register().padding(all: 4),
          ].toColumn(),
        )
      ],
    );
  }
}
