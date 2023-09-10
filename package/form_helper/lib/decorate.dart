import 'package:flutter/material.dart';

class FormDecoration {
  static InputDecoration outline = InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade500),
      borderRadius: const BorderRadius.all(
        Radius.circular(6),
      ),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade500),
      borderRadius: const BorderRadius.all(
        Radius.circular(6),
      ),
    ),
  );
}
