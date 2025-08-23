import 'package:caloriemate/Core/Utils/widgets/custom_loading_indicator.dart';
import 'package:caloriemate/Features/create_order/Manager/food_cubit.dart';
import 'package:caloriemate/Features/create_order/Manager/food_state.dart';
import 'package:caloriemate/Features/create_order/data/Model/foodmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'food_card.dart';

class FoodListView extends StatelessWidget {
  final String collectionName;
  final Map<String, int> quantities;
  final void Function(FoodModel food) onAdd;
  final void Function(FoodModel food) onRemove;

  const FoodListView({
    super.key,
    required this.collectionName,
    required this.quantities,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodCubit, FoodState>(
      builder: (context, state) {
        if (state is FoodSuccessMultiple) {
          final foods = state.allFoods[collectionName] ?? [];

          if (foods.isEmpty) {
            return const Center(child: Text("No foods found"));
          }

          return ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: foods.length,
            itemBuilder: (context, index) {
              final food = foods[index];
              final quantity = quantities[food.id] ?? 0;

              return FoodCard(
                food: food,
                quantity: quantity,
                onAdd: () => onAdd(food),
                onRemove: () => onRemove(food),
              );
            },
          );
        } else if (state is FoodFailure) {
          return Center(child: Text("Error: ${state.message}"));
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
