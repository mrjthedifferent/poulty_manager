import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:styled_widget/styled_widget.dart';

import '/config/constant/constant.dart';
import '/feature/vaccine/presentation/style/functions.dart';
import '/gen/assets.gen.dart';

class NoFirmFound extends StatelessWidget {
  const NoFirmFound({super.key});

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      const Spacer(
        flex: 2,
      ),
      Assets.images.noKhamar.image(),
      const Spacer(
        flex: 2,
      ),
      KSized.h10,
      const Text(
        'কোন ফার্ম পাওয়া যায়নি',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),

      // CREATE FIRM BUTTON
      KSized.h10,
      [
        ElevatedButton(
          style: primaryBtnStyle,
          onPressed: () {
            debugPrint('Create Firm');
            context.push('/firm');
          },
          child: Styled.text('ফার্ম তৈরি করুন').textColor(Colors.white),
        ),
        ElevatedButton(
          style: primaryBtnStyle,
          onPressed: () {
            debugPrint('Skipping Firm');
            context.push('/firm/0');
          },
          child: Styled.text('Skip').textColor(Colors.white),
        )
      ].toRow(),
      const Spacer(
        flex: 1,
      ),
    ]
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.center,
        )
        .width(double.infinity);
  }
}
