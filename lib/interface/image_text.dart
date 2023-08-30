import 'package:flutter/material.dart';

interface class ImageWithText {
  final Widget image;
  final Widget text;
  final VoidCallbackAction? onPressed;

  ImageWithText(
      {required this.image, required this.text, required this.onPressed});
}

interface class ButtonWithText {
  final Widget text;
  final VoidCallbackAction? onPressed;

  ButtonWithText({required this.text, required this.onPressed});
}

class ImageTextComponent implements ImageWithText, ButtonWithText {
  @override
  final Widget image;
  @override
  final Widget text;
  @override
  final VoidCallbackAction? onPressed;

  ImageTextComponent(
      {required this.image, required this.text, required this.onPressed});
}
