import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../config/constant/constant.dart';
import '../../../../config/theme/color.dart';
import '../../../../gen/assets.gen.dart';

Widget btnOutline(Widget child) => Styled.widget(child: child)
    .padding(horizontal: 8, vertical: 4)
    .decorated(
      color: Colors.deepOrange.shade50,
      borderRadius: BorderRadius.circular(5),
      border: Border.all(color: AppColors.primaryColor),
    )
    .alignment(Alignment.centerLeft);

Widget blueRoundBtn(Widget child, {double space = 5}) =>
    Styled.widget(child: child).padding(all: space).decorated(
          color: const Color.fromARGB(255, 44, 67, 195),
          borderRadius: BorderRadius.circular(10),
        );

Widget vaccineCard(
  String nth,
  String vaccineName,
) {
  return <Widget>[
    AspectRatio(
      aspectRatio: 2,
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color(0xff3D5BF6),
            Color(0xf0546EF7),
          ], begin: Alignment.topLeft, end: Alignment.topRight),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    Assets.icons.injection
        .svg(
          height: 50,
          width: 50,
        )
        .padding(
          all: 16,
        )
        .decorated(gradient: AppColors.blueGradient, shape: BoxShape.circle)
        .positioned(
          top: 0,
          right: 0,
        ),
    [
      RichText(
        text: TextSpan(
          text: nth,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          children: const [
            TextSpan(
              text: " ভ্যাক্সিন",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      vaccineNameWithIcon(vaccineName)
    ]
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
        )
        .positioned(
          top: 20,
          left: 20,
        )
  ].toStack();
}

Widget vaccineNameWithIcon(String vaccineName,
    {double iconSize = 20, double iconPadding = 10}) {
  return [
    blueRoundBtn(
      Assets.icons.injection.svg(
        height: iconSize,
        width: iconSize,
      ),
    ),
    SizedBox(width: iconPadding),
    blueRoundBtn(
      Styled.text(vaccineName).textColor(Colors.white),
    )
  ].toRow();
}

Widget vaccineDateCard(String title, String date, String vaccineName) {
  return [
    Styled.text(title),
    Styled.text(date),
    KSized.h10,
    vaccineNameWithIcon(vaccineName),
  ].toColumn();
}

ButtonStyle primaryBtnStyle = ElevatedButton.styleFrom(
  backgroundColor: AppColors.primaryColor,
  padding: const EdgeInsets.symmetric(
    vertical: 16,
    horizontal: 32,
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
);
