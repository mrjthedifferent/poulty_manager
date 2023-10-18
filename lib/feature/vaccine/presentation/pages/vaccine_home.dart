import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poulty_manager/gen/assets.gen.dart';
import 'package:styled_widget/styled_widget.dart';

import '/config/constant/constant.dart';
import '/feature/vaccine/presentation/style/functions.dart' as style;
import '../../../../core/Layout/extension.dart';
import '../../../batch/presentation/functions/utils.dart';

class VaccineHomePage extends StatelessWidget {
  const VaccineHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      titleWithBackArrowAndAction(
        "ভ্যাক্সিন",
        "মুরগী সুস্থ রাখতে নির্দিষ্ট দিনের মধ্যে ভ্যাক্সিন সম্পন্ন করুন এবং নিশ্চিন্তে খামার পরিচালনা করুন।",
        onBack: () {
          context.pop();
        },
      ),
      KSized.h10,
      KSized.h10,
      [
        style.btnOutline(
          Styled.text("নির্দিষ্ট সময়ঃ ৩ - ৫ দিন"),
        ),
        KSized.w4,
        style.btnOutline(
          Styled.text("বর্তমান বয়সঃ ৪ দিন"),
        )
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceEvenly),
      KSized.h10,
      KSized.h10,
      [
        Styled.text("আপনার ভ্যাক্সিন দেওয়ার সময়সীমা পার হয়ে গিয়েছে")
            .fontSize(12)
            .textColor(Colors.red.shade500),
        Styled.text("১ম ভ্যাক্সিন"),
        [
          Assets.icons.injection.svg(
            color: Colors.grey,
          ),
          Styled.text("আইবি+এনডি")
        ]
            .toRow(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center)
            .padding(horizontal: 10, vertical: 10)
            .decorated(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            )
            .constrained(minWidth: 100, maxWidth: 200),
      ].toColumn(),
      // style.vaccineCard("১ম", "আইবি+এনডি"),
      // KSized.h10,
      // ElevatedButton(
      //   // take full width

      //   style: style.primaryBtnStyle.copyWith(
      //     minimumSize: MaterialStateProperty.all(
      //       const Size(double.infinity, 50),
      //     ),
      //   ),
      //   onPressed: () {},
      //   child: Styled.text("সম্পন্ন হয়েছে")
      //       .fontSize(16)
      //       .bold()
      //       .textColor(Colors.white),
      // ),
      KSized.h10,
      [
        style
            .vaccineDateCard("পূর্বের ভ্যাক্সিন ", "০১/১২/২০২২", "আইবি+এনডি")
            .padding(horizontal: 4, vertical: 10)
            .expanded()
            .card(),
        style
            .vaccineDateCard("পরের ভ্যাক্সিন ", "০১/১২/২০২২", "আইবি+এনডি")
            .expanded()
            .padding(horizontal: 4, vertical: 10)
            .card()
      ].toRow(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
      KSized.h10,
      Styled.text("ভ্যাক্সিন দেওয়ার নিয়ম সম্পর্কে জানতে").fontSize(14).bold(),
      KSized.h10,
      [
        iconText(Assets.images.question, "কোথায় পাবেন"),
        iconText(Assets.images.book, "বই পড়ুন"),
        iconText(Assets.images.play, "ভিডিও দেখুন"),
        iconText(Assets.images.hello, "হ্যালো ডাক্তার")
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween)
    ].toColumn().parent(page);
  }

  Widget iconText(AssetGenImage img, String text) {
    return [img.image(), KSized.w4, Styled.text(text).fontSize(10).fittedBox()]
        .toColumn();
  }
}
