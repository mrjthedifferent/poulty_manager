import 'package:flutter/widgets.dart';

class AppColors {
  /// App Colors
  static const Color primaryColor = Color(0xFFFF9843);
  static const Color secondaryColor = Color(0xFF5067EB);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color white2Color = Color(0xFFF0F4FF);
  static const Color white3Color = Color(0xFFF3F4F6);
  static const Color blackColor = Color(0xFF333647);
  static const Color black2Color = Color(0xFF949CAD);
  static const Color black3Color = Color(0xFFCBCCCD);
  static const Color successColor = Color(0xFF00B74A);
  static const Color dangerColor = Color(0xFFF5002E);
  static const Color warningColor = Color(0xFFFFCB00);

  /// Gradient Colors
  static const Gradient primaryGradient = LinearGradient(
    colors: [
      Color(0xFFFF9843),
      Color(0xFFFFBB84),
    ],
  );

  static const Gradient greenGradient = LinearGradient(
    colors: [
      Color(0xFF85F9BB),
      Color(0xFF0ADB6C),
    ],
  );

  static const Gradient redGradient = LinearGradient(
    colors: [
      Color(0xFFF99085),
      Color(0xFFF76554),
    ],
  );

  static const Gradient blueGradient = LinearGradient(
    colors: [
      Color(0xFF3D5BF6),
      Color(0xFF546EF7),
    ],
  );
}
