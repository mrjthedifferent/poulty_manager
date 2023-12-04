import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poulty_manager/feature/batch_home/presentation/widgets/comment_container.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:toggle_switch/toggle_switch.dart';

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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ToggleSwitch(
                minWidth: 100,
                minHeight: 40.0,
                initialLabelIndex: 2,
                cornerRadius: 20.0,
                activeBgColor: const [Colors.white],
                inactiveBgColor: Colors.grey,
                activeFgColor: Colors.orange,
                inactiveFgColor: Colors.black,
                totalSwitches: 2,
                labels: const [
                  'সকল প্রশ্ন',
                  'আমার প্রশ্ন',
                ],
                iconSize: 30.0,
                borderWidth: 1.0,
                borderColor: const [Colors.grey],
                onToggle: (index) {
                  print('switched to: $index');
                },
              ),
            ),
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
            commentContainer(),
            commentContainer(),
            commentContainer(),
          ],
        ),
      ),
    );
  }
}
