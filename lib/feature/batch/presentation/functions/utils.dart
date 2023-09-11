import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../config/constant/constant.dart';

Widget titleWithBackArrow(String title, String subTitle, {Widget? trailing}) {
  return <Widget>[
    Styled.icon(Icons.arrow_back),
    [
      Styled.text(title).bold(),
      KSized.h10,
      Styled.text(subTitle).textColor(Colors.grey.shade500).fittedBox()
    ].toColumn().expanded(),
    if (trailing != null) trailing
  ].toRow(
    crossAxisAlignment: CrossAxisAlignment.start,
  );
}

Widget titleWithBackArrowAndAction(
  String title,
  String subTitle, {
  Widget? trailing,
  required VoidCallback onBack,
}) {
  return <Widget>[
    Styled.icon(Icons.arrow_back).gestures(onTap: onBack),
    [
      Styled.text(title).bold(),
      KSized.h10,
      Styled.text(subTitle).textColor(Colors.grey.shade500)
    ].toColumn().expanded(),
    if (trailing != null) trailing
  ].toRow(
    crossAxisAlignment: CrossAxisAlignment.start,
  );
}
