import 'package:flutter/material.dart';

import '../../../config/theme/color.dart';

final defaultFormDecoration = InputDecoration(
  enabledBorder: InputBorder.none,
  filled: true,
  fillColor: Colors.grey[100],
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: AppColors.primaryColor),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
  ),
);
