import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_helper/form_helper.dart';
import 'package:poulty_manager/config/constant/constant.dart';
import 'package:poulty_manager/config/theme/color.dart';
import 'package:poulty_manager/feature/vaccine/presentation/style/functions.dart';
import 'package:styled_widget/styled_widget.dart';

import '/gen/assets.gen.dart';
import '../../../core/Layout/extension.dart';

class RegistationPhonePage extends HookWidget {
  const RegistationPhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      const Spacer(
        flex: 1,
      ),
      Assets.images.appHen.image(),
      KSized.h10,
      Styled.text("নিবন্ধন করুন")
          .fontSize(18)
          .bold()
          .textColor(Colors.grey.shade800),
      KSized.h10,

      Styled.text("আপনার অ্যাকাউন্ট তৈরি করতে নিচের প্রয়োজনীয় তথ্যগুলো দিন।")
          .textAlignment(TextAlign.center)
          .textColor(Colors.grey.shade500)
          .alignment(Alignment.center)
          .constrained(
            width: MediaQuery.of(context).size.width * 0.8,
          ),
      KSized.h10,
      KSized.h10,

      FormHelperTextField(
        "phone",
        title: "ইমেইল",
        noTitleApply: true,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          hintText: "মোবাইল নাম্বার",
          filled: true,
          fillColor: Colors.grey[100],
          prefixIcon: const Icon(Icons.phone_android, color: Colors.grey),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.primaryColor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ).toWidget,

      KSized.h10,
      KSized.h10,
      ElevatedButton(
        style: primaryBtnStyle,
        onPressed: () {},
        child: Styled.text("পরবর্তী").fontSize(14).textColor(Colors.white),
      ).width(double.infinity).padding(horizontal: 20),
      KSized.h10,
      RichText(
        text: TextSpan(
          text: "আগে থেকেই অ্যাকাউন্ট রয়েছে ? ",
          style: const TextStyle(color: Colors.grey),
          children: [
            TextSpan(
              text: " প্রবেশ করুন",
              style: const TextStyle(color: AppColors.primaryColor),
              recognizer: TapGestureRecognizer()..onTap = () {},
            )
          ],
        ),
      ),
      KSized.h10,

      // MAKE A OR DIVIDER
      [
        KSized.w12,
        const Divider().expanded(),
        KSized.w12,
        Styled.text("অথবা").alignment(Alignment.center),
        KSized.w12,
        const Divider().expanded(),
        KSized.w12,
      ].toRow(),
      KSized.h10,
      // GOOGLE SIGN IN BUTTON

      [
        [
          Styled.icon(Icons.facebook),
          KSized.w10,
          Styled.text("Facebook").textColor(Colors.grey)

          // FACEBOOK SIGN IN BUTTON
        ].toRow().padding(all: 10).decorated(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(16),
            ),
        [
          Styled.icon(Icons.gamepad_rounded),
          KSized.w10,
          Styled.text("Google").textColor(Colors.grey)

          // FACEBOOK SIGN IN BUTTON
        ].toRow().padding(all: 10).decorated(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(16),
            ),
      ].toRow(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
      const Spacer(
        flex: 2,
      ),
    ]
        .toColumn()
        .constrained(
          height: MediaQuery.of(context).size.height,
        )
        .parent(blankPage);
  }
}
