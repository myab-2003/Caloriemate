import 'package:caloriemate/Core/Utils/constants.dart';
import 'package:caloriemate/Core/Utils/styles.dart';
import 'package:caloriemate/Core/Utils/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

class AllowedCaloriesWidget extends StatelessWidget {
  final String gender;
  final String weight;
  final String height;
  final String age;
  final int consumedCalories;
  final int allowedCalories;

  const AllowedCaloriesWidget({
    super.key,
    required this.gender,
    required this.weight,
    required this.height,
    required this.age,
    required this.consumedCalories,
    required this.allowedCalories,
  });

  @override
  Widget build(BuildContext context) {
    if (consumedCalories < allowedCalories) {
      return Text(
        "$consumedCalories Cal out of $allowedCalories Cal",
        style: Styles.textStyle18,
      );
    } else {
      // ❌ لو عدى المسموح -> نعرض SnackBar من فوق
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showTopSnackBar(
          Overlay.of(context),
          const CustomSnackBar.error(
            message: "⚠️ You have exceeded your daily calorie limit.",

            backgroundColor: Kgreycolor,
          ),
        );
      });

      return CustomText(
        title: "$consumedCalories Cal out of $allowedCalories Cal",
        style: Styles.textStyle18,
      );
    }
  }
}
