import 'package:flutter/material.dart';
import 'package:poulty_manager/config/theme/color.dart';

final kBaseThemeData = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primaryColor,
  ),
  bottomAppBarTheme: const BottomAppBarTheme(color: AppColors.primaryColor),
  cardTheme: CardTheme(
    color: AppColors.white2Color,
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
  useMaterial3: true,
);
