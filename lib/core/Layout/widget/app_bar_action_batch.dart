import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '/gen/assets.gen.dart';

class AppBarActionBatch extends StatelessWidget {
  const AppBarActionBatch({
    super.key,
    required this.icon,
    required this.text,
    this.color,
    this.onPressed,
  });

  final SvgGenImage icon;
  final String text;
  final VoidCallback? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: [
        icon.svg(color: Colors.white).positioned(bottom: 0, left: 0),
        Styled.text(
          text,
        )
            .textColor(Colors.white)
            .textStyle(
              const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            )
            .padding(horizontal: 3, vertical: 1)
            .decorated(
              color: color ?? Colors.red,
              borderRadius: BorderRadius.circular(10),
            )
            .positioned(
              top: 0,
              right: 0,
            )
      ].toStack().constrained(height: 40, width: 36),
    );
  }
}
