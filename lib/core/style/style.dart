import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../config/theme/color.dart';

Widget dataShowItem(String title, String value) => [
      Styled.text(title)
          .bold()
          .center()
          .padding(vertical: 4)
          .decorated(color: Colors.grey.shade300)
          .expanded(),
      const VerticalDivider(
        color: Colors.grey,
        thickness: 4,
      ),
      Styled.text(value).padding(vertical: 6).expanded(),
    ]
        .toRow()
        .decorated(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(4),
        )
        .padding(vertical: 4);

Widget dataShow(Map<String, String> data) => data.keys
    .map(
      (e) => dataShowItem(e, data[e]!),
    )
    .toList()
    .toColumn();

Widget progressIndicator(double progress,
    {double height = 15, String text = "% সম্পন্ন"}) {
  return [
    LinearProgressIndicator(
      value: progress,
      borderRadius: BorderRadius.circular(10),
      minHeight: height,
      backgroundColor: Colors.grey.shade200,
      color: AppColors.primaryColor,
    ),
    Styled.text("${(progress * 100).toInt()}$text ")
        .fontSize(12)
        .textColor(Colors.grey.shade700)
  ].toStack(alignment: AlignmentDirectional.center);
}
