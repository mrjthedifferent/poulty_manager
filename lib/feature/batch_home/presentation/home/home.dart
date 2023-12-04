import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poulty_manager/feature/batch_home/presentation/widgets/comment_container.dart';
import 'package:styled_widget/styled_widget.dart';

class BatchHomeMainPage extends HookConsumerWidget {
  const BatchHomeMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Styled.text("খামারি ঘর").textColor(Colors.white).fontSize(18),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.asset(
                "assets/images/batch_home_banner.png",
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            commentContainer(),
          ],
        ),
      ),
    );
  }
}
