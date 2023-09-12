import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '/config/constant/constant.dart';
import '../../../../core/Layout/extension.dart';

final batchData = <String, String>{
  'ব্যাচের নাম': '020120231212',
  'ব্যাচের ধরন': 'মুরগি',
  'ব্যাচের সংখ্যা': '1000',
  'ট্রাঞ্জাকেশন আইডি ': '020120231212',
  'ব্যাচের সময়কাল': '১০০ দিন',
};

class NewBatchShow extends StatelessWidget {
  const NewBatchShow({super.key});

  static Widget batchItem(String title, String value) => [
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

  @override
  Widget build(BuildContext context) {
    return [
      <Widget>[
        Styled.icon(Icons.arrow_back),
        [
          Styled.text("নতুন ব্যাচ শুরু করুন").bold(),
          KSized.h10,
          Styled.text("নতুন ব্যাচ শুরু করতে সকল তথ্য নিচে দিন")
              .textColor(Colors.grey.shade500)
              .fittedBox()
        ].toColumn().expanded(),
        Styled.icon(Icons.edit)
      ].toRow(
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      KSized.h10,
      batchData.keys
          .map(
            (e) => batchItem(e, batchData[e]!),
          )
          .toList()
          .toColumn(),
    ].toColumn().parent(page);
  }
}
