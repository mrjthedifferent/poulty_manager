import 'package:flutter/material.dart';

class FormDecoration {
  static InputDecoration outline({String? hint}) {
    return InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
