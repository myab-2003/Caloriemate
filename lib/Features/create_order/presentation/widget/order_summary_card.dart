import 'package:caloriemate/Core/Utils/constants.dart';
import 'package:caloriemate/Core/Utils/size_confige.dart';
import 'package:caloriemate/Core/Utils/styles.dart';
import 'package:flutter/material.dart';
import 'allowed_calories_widget.dart';
import 'price_widget.dart';
import 'package:caloriemate/Features/detailds/presentation/widgets/NextButton.dart';

class OrderSummaryCard extends StatelessWidget {
  final int consumedCalories;
  final int allowedCalories;
  final double totalPrice;
  final VoidCallback onPlaceOrder;
  final String gender;
  final String weight;
  final String height;
  final String age;

  const OrderSummaryCard({
    super.key,
    required this.consumedCalories,
    required this.allowedCalories,
    required this.totalPrice,
    required this.onPlaceOrder,
    required this.gender,
    required this.weight,
    required this.height,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.defaultSize! * 22,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Kwhitecolor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Calories Row
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.defaultSize! * 2,
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Cal", style: Styles.textStyle16),
                AllowedCaloriesWidget(
                  gender: gender,
                  weight: weight,
                  height: height,
                  age: age,
                  consumedCalories: consumedCalories,
                  allowedCalories: allowedCalories,
                ),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.defaultSize! * 2),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.defaultSize! * 2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Price", style: Styles.textStyle16),
                PriceWidget(totalPrice: totalPrice),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.defaultSize! * 2),
          NextButton(
            text: "Place order",
            isEnabled:
                (consumedCalories < allowedCalories * 0.9 &&
                consumedCalories != allowedCalories * 0.9 &&
                consumedCalories! > allowedCalories * 0.8),
            onPressed:
                (consumedCalories < allowedCalories * 0.9 &&
                    consumedCalories != allowedCalories * 0.9 &&
                    consumedCalories! > allowedCalories * 0.8)
                ? onPlaceOrder
                : null,
          ),
        ],
      ),
    );
  }
}
