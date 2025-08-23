import 'package:caloriemate/Core/Utils/widgets/Custom_button.dart';
import 'package:caloriemate/Core/Utils/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:caloriemate/Core/Utils/constants.dart';
import 'package:caloriemate/Core/Utils/styles.dart';
import 'package:caloriemate/Core/Utils/size_confige.dart';

class OrderSummarycard extends StatelessWidget {
  final int consumedCalories;
  final int allowedCalories;
  final double totalPrice;
  final VoidCallback onConfirm;

  const OrderSummarycard({
    super.key,
    required this.consumedCalories,
    required this.allowedCalories,
    required this.totalPrice,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.defaultSize! * 22,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Kwhitecolor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: SizeConfig.defaultSize! * .5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(title: "Cals", style: Styles.textStyle16),
              CustomText(
                title: "$consumedCalories Cal out of $allowedCalories Cal",
                style: Styles.textStyle18,
              ),
            ],
          ),
          SizedBox(height: SizeConfig.defaultSize! * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(title: "Price", style: Styles.textStyle16),
              CustomText(
                title: "\$${totalPrice.toStringAsFixed(2)}",
                style: Styles.textStyle18.copyWith(color: kPrimaryColor),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.defaultSize! * 2),
          MainCustombuttons(
            OnTap: onConfirm,
            buttonname: 'Confirm',
            color: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
