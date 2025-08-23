import 'package:caloriemate/Core/Utils/styles.dart';
import 'package:flutter/material.dart';
import 'calorie_calculatorhelper.dart';

class CalorieText extends StatelessWidget {
  final String gender;
  final String weight;
  final String height;
  final String age;

  const CalorieText({
    super.key,
    required this.gender,
    required this.weight,
    required this.height,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    final totalCal = CalorieCalculatorHelper.calculateCalories(
      gender: gender,
      weight: weight,
      height: height,
      age: age,
    ).round();

    return Text(
      "out of $totalCal Cal",
      style: Styles.textStyle18,
    );
  }
}
