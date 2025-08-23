import 'package:caloriemate/Core/Utils/widgets/Custom_appbar.dart';
import 'package:caloriemate/Features/create_order/data/Model/foodmodel.dart';
import 'package:caloriemate/Features/order_summary/presentation/view/ordersummarybody.dart';
import 'package:flutter/material.dart';

class OrderSummaryview extends StatelessWidget {
  final int consumedCalories;
  final int allowedCalories;
  final double totalPrice;
  final Map<FoodModel, int> selectedFoods;

  const OrderSummaryview({
    super.key,
    required this.consumedCalories,
    required this.allowedCalories,
    required this.totalPrice,
    required this.selectedFoods,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: "Order Summary"),
      body: Ordersummarybody(
        consumedCalories: consumedCalories,
        allowedCalories: allowedCalories,
        totalPrice: totalPrice,
        selectedFoods: selectedFoods,
      ),
    );
  }
}
