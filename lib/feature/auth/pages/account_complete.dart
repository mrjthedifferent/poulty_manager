import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_helper/form_helper.dart';
import 'package:poulty_manager/config/constant/constant.dart';
import 'package:poulty_manager/core/Layout/extension.dart';
import 'package:poulty_manager/feature/auth/style/style.dart';
import 'package:poulty_manager/feature/vaccine/presentation/style/functions.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../config/theme/color.dart';

class AccountCompletePage extends HookWidget {
  const AccountCompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isChecked = useState(false);
    return <Widget>[
      const Spacer(
        flex: 1,
      ),
      Styled.text("অ্যাকাউন্ট সম্পন্ন করুন")
          .fontSize(18)
          .bold()
          .textAlignment(TextAlign.center)
          .textColor(Colors.grey.shade800),
      KSized.h12,
      Styled.text("আপনার অ্যাকাউন্ট তৈরি করতে নিচের প্রয়োজনীয় তথ্যগুলো দিন।")
          .fontSize(14)
          .textAlignment(TextAlign.center)
          .textColor(Colors.grey.shade500),
      FormHelperTextField(
        "name",
        title: "name",
        noTitleApply: true,
        decoration: defaultFormDecoration.copyWith(
          hintText: "আপনার পুরো নাম",
          prefixIcon: const Icon(Icons.person_outline, color: Colors.grey),
        ),
      ).toWidget,
      KSized.h12,
      FormHelperTextField(
        "password",
        title: "pass",
        noTitleApply: true,
        decoration: defaultFormDecoration.copyWith(
          hintText: "পাসওয়ার্ড",
          prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
        ),
      ).toWidget,
      KSized.h12,
      FormHelperTextField(
        "ref_id",
        title: "ref_id",
        noTitleApply: true,
        decoration: defaultFormDecoration.copyWith(
          hintText: "রেফারেল আইডি (যদি থাকে)",
          prefixIcon: const Icon(Icons.email_sharp, color: Colors.grey),
        ),
      ).toWidget,
      KSized.h12,
      FormHelperRadio(
        "f_person",
        title: "আপনি একজন?",
        option: {"1": "খামারি", "0": "ক্রেতা", "2": "টিম মেম্বার"},
      ).toWidget.padding(
            left: 10,
          ),
      KSized.h10,
      [
        Checkbox(
          value: isChecked.value,
          onChanged: (val) {
            isChecked.value = !isChecked.value;
          },
        ),
        RichText(
          text: const TextSpan(
            text: "I accept ",
            style: TextStyle(color: Colors.grey, fontSize: 12),
            children: [
              TextSpan(
                text: "Terms and conditions",
                style: TextStyle(color: AppColors.primaryColor),
              ),
              TextSpan(
                text: " & privacy policy ",
              )
            ],
          ),
        ).expanded(),
      ].toRow(),
      KSized.h12,
      KSized.h12,
      ElevatedButton(
        onPressed: () {},
        style: primaryBtnStyle,
        child: Styled.text("অ্যাকাউন্টে তৈরি করুন").textColor(Colors.white),
      ).width(double.infinity).padding(
            horizontal: 10,
          ),
      const Spacer(
        flex: 2,
      ),
    ]
        .toColumn()
        .height(
          MediaQuery.of(context).size.height,
        )
        .parent(blankPage);
  }
}
