import 'package:caloriemate/Features/order_summary/presentation/widget/order_list.dart';
import 'package:caloriemate/Features/order_summary/presentation/widget/order_summarycard.dart';
import 'package:flutter/material.dart';
import 'package:caloriemate/Features/create_order/data/Model/foodmodel.dart';


class Ordersummarybody extends StatefulWidget {
  final int consumedCalories;
  final int allowedCalories;
  final Map<FoodModel, int> selectedFoods;

  const Ordersummarybody({
    super.key,
    required this.consumedCalories,
    required this.allowedCalories,
    required this.selectedFoods, required double totalPrice,
  });

  @override
  State<Ordersummarybody> createState() => _OrdersummarybodyState();
}

class _OrdersummarybodyState extends State<Ordersummarybody> {
  late Map<FoodModel, int> _quantities;
  final double fixedPrice = 12;

  @override
  void initState() {
    super.initState();
    _quantities = Map.from(widget.selectedFoods);
  }

  void _increment(FoodModel food) {
    setState(() {
      _quantities[food] = (_quantities[food] ?? 0) + 1;
    });
  }

  void _decrement(FoodModel food) {
    setState(() {
      if ((_quantities[food] ?? 0) > 1) {
        _quantities[food] = _quantities[food]! - 1;
      }
    });
  }

  double get totalPrice {
    double sum = 0;
    _quantities.forEach((food, qty) {
      sum += qty * fixedPrice;
    });
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: OrderList(
            quantities: _quantities,
            fixedPrice: fixedPrice,
            onIncrement: _increment,
            onDecrement: _decrement,
          ),
        ),
        OrderSummarycard(
          consumedCalories: widget.consumedCalories,
          allowedCalories: widget.allowedCalories,
          totalPrice: totalPrice,
          onConfirm: () {
            final updatedOrder = {
              "foods": _quantities,
              "totalPrice": totalPrice,
            };
            print(updatedOrder);
          },
        ),
      ],
    );
  }
}
