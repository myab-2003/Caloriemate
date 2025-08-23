import 'package:flutter/material.dart';
import 'package:caloriemate/Features/create_order/data/Model/foodmodel.dart';
import 'order_item_card.dart';

class OrderList extends StatelessWidget {
  final Map<FoodModel, int> quantities;
  final double fixedPrice;
  final void Function(FoodModel) onIncrement;
  final void Function(FoodModel) onDecrement;

  const OrderList({
    super.key,
    required this.quantities,
    required this.fixedPrice,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: quantities.length,
      itemBuilder: (context, index) {
        final food = quantities.keys.elementAt(index);
        final quantity = quantities[food]!;
        return OrderItemCard(
          food: food,
          quantity: quantity,
          fixedPrice: fixedPrice,
          onIncrement: () => onIncrement(food),
          onDecrement: () => onDecrement(food),
        );
      },
    );
  }
}
