import 'package:caloriemate/Core/Utils/constants.dart';
import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  final double totalPrice;

  const PriceWidget({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Text(
      "\$ ${totalPrice.toStringAsFixed(2)}",
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: kPrimaryColor,
      ),
    );
  }
}
