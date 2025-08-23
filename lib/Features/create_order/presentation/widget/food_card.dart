
import 'package:caloriemate/Core/Utils/constants.dart';
import 'package:caloriemate/Core/Utils/size_confige.dart';
import 'package:caloriemate/Core/Utils/styles.dart';
import 'package:caloriemate/Core/Utils/widgets/text.dart';
import 'package:caloriemate/Features/create_order/data/Model/foodmodel.dart';
import 'package:caloriemate/Features/create_order/presentation/widget/QuantityController.dart';
import 'package:caloriemate/Features/create_order/presentation/widget/networkimage.dart';
import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final FoodModel food;
  final int quantity;
  final void Function() onAdd;
  final void Function() onRemove;
  final double fixedPrice = 12;

  const FoodCard({
    super.key,
    required this.food,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Container(
        width: SizeConfig.defaultSize! * 23,
        decoration: BoxDecoration(
          color: Kwhitecolor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.defaultSize! * 1,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: SizeConfig.defaultSize! * .5),
              Networkimage(imageUrl: food.imageUrl , h:  SizeConfig.defaultSize! * 20 , w: SizeConfig.defaultSize! * 20,),
              SizedBox(height: SizeConfig.defaultSize! * .5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    title: food.foodName,
                    style: Styles.textStyle16,
                  ),
                  const SizedBox(width: 2),
                  CustomText(
                    title: '${food.calories} Cal',
                    style: Styles.textStyle18,
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.defaultSize! * 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    title: '\$$fixedPrice',
                    style: Styles.textStyle16,
                  ),
                  SizedBox(width: SizeConfig.defaultSize! * 1),
                  // ✅ استدعاء الويدجت الجديدة
                  QuantityController(
                    quantity: quantity,
                    onAdd: onAdd,
                    onRemove: onRemove,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
