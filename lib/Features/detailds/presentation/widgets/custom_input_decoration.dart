import 'package:flutter/material.dart';
import 'package:caloriemate/Core/Utils/constants.dart';

class CustomInputDecoration {
  static InputDecoration build() {
    return InputDecoration(
      filled: true,
      fillColor: Kwhitecolor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Kbuttoncolor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Kbuttoncolor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Kbuttoncolor, width: 1.2),
      ),
    );
  }
}
