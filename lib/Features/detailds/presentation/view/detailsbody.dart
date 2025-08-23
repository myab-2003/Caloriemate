import 'package:caloriemate/Config/routes.dart';
import 'package:caloriemate/Core/Utils/size_confige.dart';
import 'package:caloriemate/Features/detailds/presentation/widgets/DetailsForm.dart';
import 'package:caloriemate/Features/detailds/presentation/widgets/NextButton.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Detailsbody extends StatefulWidget {
  const Detailsbody({super.key});

  @override
  State<Detailsbody> createState() => _DetailsbodyState();
}

class _DetailsbodyState extends State<Detailsbody> {
  String? gender;
  String? weight;
  String? height;
  String? age;

  bool get isFormValid =>
      gender != null && weight != null && height != null && age != null;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          SizedBox(height: SizeConfig.defaultSize! * 4),
          DetailsForm(
            onChanged:
                ({
                  required String? gender,
                  required String? weight,
                  required String? height,
                  required String? age,
                }) {
                  setState(() {
                    this.gender = gender;
                    this.weight = weight;
                    this.height = height;
                    this.age = age;
                  });
                },
          ),
          SizedBox(height: SizeConfig.defaultSize! * 20),
          NextButton(
            text: 'Next',
            isEnabled: isFormValid,
            onPressed: () {
              GoRouter.of(context).push(
                AppRouter.kcreateorder,
                extra: {
                  'gender': gender!,
                  'weight': weight!,
                  'height': height!,
                  'age': age!,
                },
              );

            },
          ),
        ],
      ),
    );
  }
}
