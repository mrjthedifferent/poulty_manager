import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_helper/form_helper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poulty_manager/config/constant/constant.dart';
import 'package:poulty_manager/config/theme/color.dart';
import 'package:poulty_manager/core/hooks/request/get_client.dart';
import 'package:poulty_manager/feature/vaccine/presentation/style/functions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:styled_widget/styled_widget.dart';

import '/gen/assets.gen.dart';
import '../../../core/Layout/extension.dart';
import '../../../core/client/request_client.dart';

part 'sign_in.g.dart';

@riverpod
Future<Map<String, dynamic>> fetchTodos(FetchTodosRef ref) async {
  final client = ref.watch(requestClientProvider);
  return client.client
      .get<Map<String, dynamic>>('todos/1')
      .then((value) => value.data ?? {});
}

class SignInPage extends HookConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showPassword = useState<bool>(true);

    final handleLogin = useRequestHandler(ref.watch(requestHandlerProvider));

    return <Widget>[
      const Spacer(
        flex: 1,
      ),
      Assets.images.appHen.image(),
      KSized.h10,
      Styled.text("সাইন ইন").textColor(Colors.grey.shade500),

      handleLogin.status.when(
        initial: () => const Center(child: Text("initial")),
        loading: () => const Center(child: Text("loading")),
        error: (error) => Center(child: Text(error)),
        success: (data) => Center(
          child: Text(
            data.toString(),
          ),
        ),
      ),
      KSized.h10,
      Styled.text("আপনার অ্যাকাউন্টে প্রবেশ করতে নিচের প্রয়োজনীয় তথ্যগুলো দিন।")
          .textColor(Colors.grey.shade500)
          .alignment(Alignment.center)
          .constrained(
            width: MediaQuery.of(context).size.width * 0.8,
          ),
      KSized.h10,
      KSized.h10,

      FormHelperTextField(
        "email",
        title: "ইমেইল",
        noTitleApply: true,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          hintText: "ইমেইল/ফোন নম্বর",
          filled: true,
          fillColor: Colors.grey[100],
          prefixIcon: const Icon(Icons.email_outlined, color: Colors.grey),
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
      FormHelperTextField(
        "password",
        title: "password",
        noTitleApply: true,
        maxLine: 1,
        obscureText: showPassword.value,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.primaryColor),
          ),
          hintText: "পাসওয়ার্ড",
          suffixIcon: showPassword.value
              ? Styled.icon(Icons.visibility_off, color: Colors.grey.shade500)
                  .gestures(onTap: () {
                  showPassword.value = !showPassword.value;
                })
              : Styled.icon(Icons.visibility, color: Colors.grey.shade500)
                  .gestures(onTap: () {
                  showPassword.value = !showPassword.value;
                }),
          filled: true,
          fillColor: Colors.grey[100],
          prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ).toWidget,
      KSized.h10,
      Styled.text("পাসওয়ার্ড ভুলে গেছেন?")
          .textColor(Colors.grey)
          .alignment(Alignment.centerRight),
      KSized.h10,
      KSized.h10,
      ElevatedButton(
        style: primaryBtnStyle,
        onPressed: () {
          handleLogin.trigger("/posts", method: "POST", data: {
            "title": "foo",
            "body": "bar",
            "userId": 1,
          });
        },
        child: Styled.text("অ্যাকাউন্টে প্রবেশ করুন")
            .fontSize(14)
            .textColor(Colors.white),
      ),
      KSized.h10,
      RichText(
        text: TextSpan(
          text: "অ্যাকাউন্ট নেই? ",
          style: const TextStyle(color: Colors.grey),
          children: [
            TextSpan(
              text: "সাইন আপ করুন",
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
