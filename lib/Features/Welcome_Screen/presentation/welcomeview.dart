import 'package:caloriemate/Core/Utils/constants.dart';
import 'package:caloriemate/Features/Welcome_Screen/presentation/view/welcomebody.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/welcome.png"), // ضع الصورة هنا
            fit: BoxFit.cover,
          ),
        ),
        child: const Welcomebody(),
      ),
    );
  }
}
