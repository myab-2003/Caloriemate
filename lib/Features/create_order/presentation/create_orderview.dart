import 'package:caloriemate/Core/Utils/size_confige.dart';
import 'package:caloriemate/Core/Utils/widgets/Custom_appbar.dart';
import 'package:caloriemate/Features/create_order/presentation/view/createorderbody.dart';
import 'package:flutter/material.dart';

class Createorderview extends StatelessWidget {
  final String gender;
  final String weight;
  final String height;
  final String age;

  const Createorderview({
    super.key,
    required this.gender,
    required this.weight,
    required this.height,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: CustomAppbar(title: "Create your order"),
      resizeToAvoidBottomInset: false,
      body: CreateOrderBody(
        gender: gender,
        weight: weight,
        height: height,
        age: age,
      ),
    );
  }
}
