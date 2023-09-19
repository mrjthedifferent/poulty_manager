import 'package:flutter/material.dart';
import 'package:poulty_manager/config/constant/constant.dart';
import 'package:poulty_manager/core/style/style.dart';
import 'package:poulty_manager/feature/batch/presentation/functions/utils.dart';
import 'package:poulty_manager/feature/vaccine/presentation/style/functions.dart';
import 'package:styled_widget/styled_widget.dart';

import '/core/Layout/extension.dart';
import '../../../../config/theme/color.dart';

class DailyAdvice extends StatelessWidget {
  const DailyAdvice({super.key});

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      titleWithBackArrowAndAction("দৈনিক পরামর্শ",
          "মুর্গির বয়স অনুপাতে সঠিক ভাবে ফার্ম পরচালনা করতে দৈনিক গাইড লাইন ফলো করুন, ঝামেলাহীন থাকুন।",
          onBack: () {
        Navigator.pop(context);
      }),
      KSized.h12,
      dataShow({
        "ব্যাচ নামঃ": "ব্রয়লার",
        "সম্ভাব্য বিক্রয়ঃ": "২৭ শে অক্টোবর (রবিবার)",
        "মুরগি সংখ্যা": "১০২০"
      }),
      KSized.h12,
      progressIndicator(0.5, height: 25),
      KSized.h12,
      adviceItem(),
      KSized.h12,
      adviceItem(title: "খাবার পাত্রর দূরত্বঃ ২ ফিট"),
      KSized.h12,
      adviceItem(title: "ব্রুডার লাইট সংখ্যা ৮ টি"),
      KSized.h12,
      adviceItem(title: "গড় পানির পরিমাণঃ ২০ গ্রাম"),
    ].toColumn().parent(page);
  }

  Widget adviceItem(
      {String title = "পানি পাত্রর দূরত্বঃ ২ ফিট", String status = "সম্পন্ন"}) {
    return [
      Styled.text(title),
      ElevatedButton(
        style: primaryBtnStyle,
        onPressed: () {},
        child: Styled.text(status).textColor(Colors.white),
      )
    ]
        .toRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        )
        .padding(all: 10)
        .decorated(
          // make only bottom border
          border: Border.all(
            color: AppColors.primaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        );
  }
}
