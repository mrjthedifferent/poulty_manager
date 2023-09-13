import 'package:flutter/material.dart';

class FormDecoration {
  static InputDecoration outline = InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade500),
      borderRadius: const BorderRadius.all(
        Radius.circular(6),
      ),
    ),
    fillColor: Colors.grey.shade100,
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade500),
      borderRadius: const BorderRadius.all(
        Radius.circular(6),
      ),
    ),
  );
}
