import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '/config/config.dart';

class TwoTextColumn extends StatelessWidget {
  final String uppertext;
  final String lowerText;
  const TwoTextColumn({
    super.key,
    required this.uppertext,
    required this.lowerText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.primaryColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: [
        Styled.text(uppertext).fontSize(12),
        Styled.text(lowerText)
            .fontSize(12)
            .padding(horizontal: 6, vertical: 2)
            .decorated(
              color: AppColors.primaryColor,
            )
      ]
          .toColumn(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          )
          .constrained(
            minHeight: 40,
          ),
    );
  }
}
