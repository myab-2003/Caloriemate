import 'package:caloriemate/Core/Utils/constants.dart';
import 'package:caloriemate/Core/Utils/size_confige.dart';
import 'package:caloriemate/Core/Utils/widgets/text.dart';
import 'package:caloriemate/Features/create_order/presentation/widget/networkimage.dart';
import 'package:flutter/material.dart';
import 'package:caloriemate/Core/Utils/styles.dart';
import 'package:caloriemate/Features/create_order/data/Model/foodmodel.dart';

class OrderItemCard extends StatelessWidget {
  final FoodModel food;
  final int quantity;
  final double fixedPrice;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const OrderItemCard({
    super.key,
    required this.food,
    required this.quantity,
    required this.fixedPrice,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Networkimage(
            imageUrl: food.imageUrl,
            h: SizeConfig.defaultSize! * 8,
            w: SizeConfig.defaultSize! * 8,
          ),
          SizedBox(width: SizeConfig.defaultSize! * 2),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title: food.foodName,
                  style: Styles.textStyle16,
                ),
                SizedBox(height: SizeConfig.defaultSize! * .5),
                CustomText(
                  title: '${food.calories} Cal',
                  style: Styles.textStyle18,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: SizeConfig.defaultSize! * .5),
                Text("\$$fixedPrice", style: Styles.textStyle16),

                const SizedBox(width: 12),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: onDecrement,
                      icon: const Icon(
                        Icons.remove_circle,
                        color: kPrimaryColor,
                      ),
                    ),
                    Text("x$quantity", style: Styles.textStyle16),
                    IconButton(
                      onPressed: onIncrement,
                      icon: const Icon(Icons.add_circle, color: kPrimaryColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
