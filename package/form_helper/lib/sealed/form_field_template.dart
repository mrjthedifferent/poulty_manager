import 'package:flutter/material.dart';

class FormFieldTemplate extends StatelessWidget {
  const FormFieldTemplate(
      {super.key,
      required this.child,
      required this.title,
      this.isRequired = false});

  final Widget child;
  final String title;
  final bool? isRequired;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Text(title),
        // Text(title),
        const SizedBox(
          height: 5,
        ),
        child,
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
