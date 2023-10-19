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
  const AccountCompletePage({super.key, required this.onRegister});

  final void Function(Map<String, dynamic>) onRegister;

  @override
  Widget build(BuildContext context) {
    final isChecked = useState(false);
    // make controller for name, password,confirm_password, ref_id, and person_type state
    final nameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final conformController = useTextEditingController();
    final refIdController = useTextEditingController();

    final userType = useState<String?>(null);

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
        controller: nameController,
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
        controller: passwordController,
        noTitleApply: true,
        obscureText: true,
        maxLine: 1,
        decoration: defaultFormDecoration.copyWith(
          hintText: "পাসওয়ার্ড",
          prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
        ),
      ).toWidget,
      KSized.h12,
      KSized.h12,
      FormHelperTextField(
        "conform_password",
        title: "pass",
        obscureText: true,
        controller: conformController,
        noTitleApply: true,
        maxLine: 1,
        decoration: defaultFormDecoration.copyWith(
          hintText: "কনফার্ম পাসওয়ার্ড",
          prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
        ),
      ).toWidget,
      KSized.h12,
      FormHelperTextField(
        "ref_id",
        title: "ref_id",
        controller: refIdController,
        noTitleApply: true,
        decoration: defaultFormDecoration.copyWith(
          hintText: "রেফারেল আইডি (যদি থাকে)",
          prefixIcon: const Icon(Icons.email_sharp, color: Colors.grey),
        ),
      ).toWidget,
      KSized.h12,
      FormHelperRadio(
        "role",
        title: "আপনি একজন?",
        onChanged: (value) => userType.value = value,
        option: {"খামারি": "1", "ক্রেতা": "0", "টিম মেম্বার": "2"},
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
        onPressed: () {
          //if any controller or value is empty , password and confirm password is not match and isCheck is false then return
          if (nameController.text.isEmpty ||
              passwordController.text.isEmpty ||
              refIdController.text.isEmpty ||
              userType.value == null ||
              !isChecked.value) {
            // show snakebar
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("সব তথ্য দিন"),
              ),
            );
            return;
          } else {
            if (passwordController.text != conformController.text) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("পাসওয়ার্ড মিলছে না"),
                ),
              );
              return;
            } else {
              onRegister(
                {
                  "name": nameController.text,
                  "password": passwordController.text,
                  "password_confirmation": conformController.text,
                  "ref_id": refIdController.text,
                  "role": userType.value,
                },
              );
            }
          }

          // call onRegister function
        },
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
