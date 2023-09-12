import 'package:flutter/material.dart';
import 'package:poulty_manager/config/config.dart';
import 'package:poulty_manager/feature/batch/presentation/functions/utils.dart';
import 'package:poulty_manager/gen/assets.gen.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../config/constant/constant.dart';
import '../../../../core/Layout/extension.dart';

class DoctorVisitShow extends StatelessWidget {
  const DoctorVisitShow({super.key});

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      titleWithBackArrowAndAction("ডাক্তার ভিজিট",
          "মুরগী সুস্থ রাখতে নির্দিষ্ট দিনের মধ্যে ভ্যাক্সিন সম্পন্ন করুন এবং নিশ্চিন্তে খামার পরিচালনা করুন।",
          onBack: () {}),
      KSized.h10,
      doctorVisitTile(Assets.images.doctor, "ডাঃ মোঃ আব্দুল কাদের",
          "প্রধান চিকিৎসক", "তারিখঃ ১ জানুয়ারি ২০২২"),
      doctorVisitTile(Assets.images.doctor, "ডাঃ জাহাঙ্গীর কবির", "MBBS",
          "তারিখঃ ১ জানুয়ারি ২০২২"),
      doctorVisitTile(Assets.images.doctor, "ডাঃ শেখ মুজিব", "প্রধান চিকিৎসক",
          "তারিখঃ ১ জানুয়ারি ২০২২"),
    ].toColumn().parent(page);
  }

  Widget doctorVisitTile(
    AssetGenImage image,
    String name,
    String designation,
    String date,
  ) {
    return [
      image.image(height: 50),
      [
        Styled.text(name).bold(),
        Styled.text(designation).fontSize(12).textColor(AppColors.primaryColor),
        Styled.text(date).fontSize(10).padding(all: 4).decorated(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(10),
            )
      ].toColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      Styled.icon(Icons.arrow_forward)
          .padding(all: 6)
          .decorated(color: Colors.grey.shade300, shape: BoxShape.circle)
    ]
        .toRow(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        )
        .padding(
          all: 6,
        )
        .decorated(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        )
        .padding(vertical: 10);
  }
}
