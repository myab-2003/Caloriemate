import 'package:caloriemate/Config/routes.dart';
import 'package:caloriemate/Core/Utils/size_confige.dart';
import 'package:caloriemate/Core/Utils/styles.dart';
import 'package:caloriemate/Core/Utils/widgets/custom_loading_indicator.dart';
import 'package:caloriemate/Core/Utils/widgets/text.dart';
import 'package:caloriemate/Features/create_order/Manager/food_cubit.dart';
import 'package:caloriemate/Features/create_order/Manager/food_state.dart';
import 'package:caloriemate/Features/create_order/data/Model/foodmodel.dart';
import 'package:caloriemate/Features/create_order/presentation/widget/calorie_calculatorhelper.dart';
import 'package:caloriemate/Features/create_order/presentation/widget/foods_listview.dart';
import 'package:caloriemate/Features/create_order/presentation/widget/order_summary_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// 👇 الكلاس الأساسي اللي ناقص عندك
class CreateOrderBody extends StatefulWidget {
  const CreateOrderBody({
    super.key,
    required this.gender,
    required this.weight,
    required this.height,
    required this.age,
  });

  final String gender;
  final String weight;
  final String height;
  final String age;

  @override
  State<CreateOrderBody> createState() => _CreateOrderBodyState();
}

class _CreateOrderBodyState extends State<CreateOrderBody> {
  int consumedCalories = 0;
  double totalPrice = 0;
  int? allowedCalories;
  final double fixedPrice = 16;
  final Map<String, int> quantities = {}; // productId -> quantity

  @override
  void initState() {
    super.initState();
    allowedCalories = CalorieCalculatorHelper.calculateCalories(
      gender: widget.gender,
      weight: widget.weight,
      height: widget.height,
      age: widget.age,
    ).round();
  }

  void _recalculateTotals() {
    int newCalories = 0;
    double newPrice = 0;

    for (var entry in quantities.entries) {
      final foodId = entry.key;
      final qty = entry.value;

      if (qty > 0) {
        // هات الـ food من الكيوبت
        final food = (context.read<FoodCubit>().state as FoodSuccessMultiple)
            .allFoods
            .values
            .expand((list) => list)
            .firstWhere((f) => f.id == foodId);

        newCalories += food.calories * qty;
        newPrice += fixedPrice * qty;
      }
    }

    setState(() {
      consumedCalories = newCalories;
      totalPrice = newPrice;
    });
  }

  void _addFood(FoodModel food) {
    setState(() {
      quantities[food.id] = (quantities[food.id] ?? 0) + 1;
    });
    _recalculateTotals();
  }

  void _removeFood(FoodModel food) {
    setState(() {
      if ((quantities[food.id] ?? 0) > 0) {
        quantities[food.id] = (quantities[food.id]! - 1);
      }
    });
    _recalculateTotals();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if (allowedCalories == null) {
      return const Center(child: CustomLoadingIndicator());
    }

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.defaultSize! * 2,
            ),
            child: ListView(
              children: [
                SizedBox(height: SizeConfig.defaultSize! * 2),
                CustomText(title: 'Vegetables', style: Styles.textStyle22),
                SizedBox(height: SizeConfig.defaultSize! * 1),
                SizedBox(
                  height: SizeConfig.defaultSize! * 30,
                  child: FoodListView(
                    collectionName: "vegetables",
                    quantities: quantities,
                    onAdd: _addFood,
                    onRemove: _removeFood,
                  ),
                ),
                SizedBox(height: SizeConfig.defaultSize! * 2),
                CustomText(title: 'Meat', style: Styles.textStyle22),
                SizedBox(height: SizeConfig.defaultSize! * 1),
                SizedBox(
                  height: SizeConfig.defaultSize! * 30,
                  child: FoodListView(
                    collectionName: "meat",
                    quantities: quantities,
                    onAdd: _addFood,
                    onRemove: _removeFood,
                  ),
                ),
                SizedBox(height: SizeConfig.defaultSize! * 2),
                CustomText(title: 'Carbs', style: Styles.textStyle22),
                SizedBox(height: SizeConfig.defaultSize! * 1),
                SizedBox(
                  height: SizeConfig.defaultSize! * 30,
                  child: FoodListView(
                    collectionName: "carb",
                    quantities: quantities,
                    onAdd: _addFood,
                    onRemove: _removeFood,
                  ),
                ),
                SizedBox(height: SizeConfig.defaultSize! * 2),
              ],
            ),
          ),
        ),
        OrderSummaryCard(
          consumedCalories: consumedCalories,
          allowedCalories: allowedCalories!,
          totalPrice: totalPrice,
          gender: widget.gender,
          weight: widget.weight,
          height: widget.height,
          age: widget.age,
          onPlaceOrder: () {
            final selectedFoods = <FoodModel, int>{};
            for (var entry in quantities.entries) {
              if (entry.value > 0) {
                final food =
                    (context.read<FoodCubit>().state as FoodSuccessMultiple)
                        .allFoods
                        .values
                        .expand((list) => list)
                        .firstWhere((f) => f.id == entry.key);

                selectedFoods[food] = entry.value;
              }
            }

            context.push(
              AppRouter.kordersummary,
              extra: {
                'consumedCalories': consumedCalories,
                'allowedCalories': allowedCalories,
                'totalPrice': totalPrice,
                'selectedFoods': selectedFoods,
              },
            );
          },
        ),
      ],
    );
  }
}
