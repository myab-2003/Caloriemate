import 'package:caloriemate/Config/routes.dart';
import 'package:caloriemate/Core/Utils/constants.dart';
import 'package:caloriemate/Core/Utils/size_confige.dart';
import 'package:caloriemate/Core/Utils/styles.dart';
import 'package:caloriemate/Core/Utils/widgets/Custom_button.dart';
import 'package:caloriemate/Features/Welcome_Screen/presentation/widget/custom_sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Welcomebody extends StatelessWidget {
  const Welcomebody({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        SizedBox(height: SizeConfig.defaultSize! * 6),
        CustomSlidingText(
          text: 'Balanced Meal',
          style: Styles.textStyle21,
          duration: Duration(milliseconds: 1000),
          x: 4,
          y: 0,
        ),
        SizedBox(height: SizeConfig.defaultSize! * 50),
        CustomSlidingText(
          text:
              'Craft your ideal meal effortlessly \n with our app. Select nutritious \n ingredients tailored to your \n taste and well-being.',
          style: Styles.textStyle14,
          duration: Duration(milliseconds: 1000),
          x: -4,
          y: 0,
        ),
        SizedBox(height: SizeConfig.defaultSize! * 2),
        MainCustombuttons(
          OnTap: () {
             GoRouter.of(
              context,
            ).push(AppRouter.kDetailsview);
          },
          buttonname: 'Order Food',
          color: kPrimaryColor,
        ),
        SizedBox(height: SizeConfig.defaultSize! * 1),
      ],
    );
  }
}
