import 'package:flutter/material.dart';
import 'package:poulty_manager/config/theme/color.dart';

final kBaseThemeData = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primaryColor,
  ),
  bottomAppBarTheme: const BottomAppBarTheme(color: AppColors.primaryColor),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
  useMaterial3: true,
);
