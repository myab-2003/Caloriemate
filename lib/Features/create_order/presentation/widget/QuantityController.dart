import 'package:flutter/material.dart';
import 'package:caloriemate/Core/Utils/constants.dart';
import 'package:caloriemate/Core/Utils/styles.dart';
import 'package:caloriemate/Core/Utils/widgets/text.dart';

class QuantityController extends StatelessWidget {
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const QuantityController({
    super.key,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    if (quantity == 0) {
      return ElevatedButton(
        onPressed: onAdd,
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: CustomText(title: 'Add', style: Styles.textStyle19),
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: onRemove,
            icon: const Icon(Icons.remove_circle, color: kPrimaryColor),
          ),
          Text(quantity.toString(), style: Styles.textStyle16),
          IconButton(
            onPressed: onAdd,
            icon: const Icon(Icons.add_circle, color: kPrimaryColor),
          ),
        ],
      );
    }
  }
}
