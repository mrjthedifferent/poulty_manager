import 'package:flutter/material.dart';
import 'package:poulty_manager/config/config.dart';
import 'package:poulty_manager/config/constant/constant.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../core/Layout/extention.dart';
import '../../../batch/presentation/functions/utils.dart';

Widget btnOutline(Widget child) => Styled.widget(child: child)
    .padding(horizontal: 8, vertical: 4)
    .decorated(
      color: Colors.deepOrange.shade50,
      borderRadius: BorderRadius.circular(5),
      border: Border.all(color: AppColors.primaryColor),
    )
    .alignment(Alignment.centerLeft);

class VaccineHomePage extends StatelessWidget {
  const VaccineHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      titleWithBackArrowAndAction(
        "ভ্যাক্সিন",
        "মুরগী সুস্থ রাখতে নির্দিষ্ট দিনের মধ্যে ভ্যাক্সিন সম্পন্ন করুন এবং নিশ্চিন্তে খামার পরিচালনা করুন।",
        onBack: () {},
      ),
      KSized.h10,
      KSized.h10,
      [
        btnOutline(
          Styled.text("নির্দিষ্ট সময়ঃ ৩ - ৫ দিন"),
        ),
        KSized.w4,
        btnOutline(
          Styled.text("বর্তমান বয়সঃ ৪ দিন"),
        )
      ].toRow(),
      KSized.h10,
      KSized.h10,
      <Widget>[
        AspectRatio(
          aspectRatio: 2.5,
          child: Container(
            decoration: BoxDecoration(
              gradient: AppColors.blueGradient,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ].toStack()
    ].toColumn().parent(page);
  }
}
