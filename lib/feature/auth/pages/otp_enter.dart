// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../config/constant/constant.dart';
import '../../../config/theme/color.dart';
import '../../../core/Layout/extension.dart';
import '../../../gen/assets.gen.dart';
import '../../vaccine/presentation/style/functions.dart';

class OTPEnterScreen extends HookConsumerWidget {
  const OTPEnterScreen({
    Key? key,
    required this.phone,
    required this.otp,
  }) : super(key: key);

  final String phone;
  final String otp;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return <Widget>[
      const Spacer(
        flex: 1,
      ),
      Assets.images.appHen.image(),
      KSized.h10,
      KSized.h10,
      KSized.h10,
      Styled.text("আপনার দেওয়া মোবাইল নাম্বারে একটি কোড গিয়েছে $otp")
          .textAlignment(TextAlign.center)
          .fontSize(18)
          .bold()
          .textColor(Colors.grey.shade800),
      KSized.h10,
      KSized.h10,
      Styled.text("কোডটি নিচে লিখুন")
          .textAlignment(TextAlign.center)
          .textColor(Colors.grey.shade500)
          .alignment(Alignment.center)
          .constrained(
            width: MediaQuery.of(context).size.width * 0.8,
          ),
      KSized.h10,
      KSized.h10,
      KSized.h10,
      PinCodeTextField(
        appContext: context,
        length: 4,
        onCompleted: (value) {
          if (otp == value) {
            context.go(
              Uri(
                path: '/auth/account-complete',
                queryParameters: {'phone': phone, 'otp': otp},
              ).toString(),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("OTP ভুল হয়েছে"),
              ),
            );
          }
        },
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldWidth: 50,
          borderWidth: 1,
          inactiveColor: Colors.grey[300],
          activeColor: AppColors.primaryColor,
          selectedColor: AppColors.primaryColor,
        ),
      ).padding(horizontal: 20),
      Styled.text("নাম্বার পরিবর্তন করুন")
          .textColor(Colors.grey.shade500)
          .alignment(Alignment.centerRight),
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
          text: "কোডটি না পেয়ে থাকলে ",
          style: const TextStyle(color: Colors.grey),
          children: [
            TextSpan(
              text: "এখানে ক্লিক করুন",
              style: const TextStyle(color: AppColors.primaryColor),
              recognizer: TapGestureRecognizer()..onTap = () {},
            )
          ],
        ),
      ),
      KSized.h10,
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
