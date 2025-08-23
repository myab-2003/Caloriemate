import 'package:caloriemate/Core/Utils/size_confige.dart';
import 'package:caloriemate/Core/Utils/styles.dart';
import 'package:caloriemate/Core/Utils/widgets/text.dart';
import 'package:flutter/material.dart';
import 'gender_field.dart';
import 'weight_field.dart';
import 'height_field.dart';
import 'age_field.dart';

class DetailsForm extends StatefulWidget {
  final void Function({
    required String? gender,
    required String? weight,
    required String? height,
    required String? age,
  })
  onChanged;

  const DetailsForm({super.key, required this.onChanged});

  @override
  State<DetailsForm> createState() => _DetailsFormState();
}

class _DetailsFormState extends State<DetailsForm> {
  final _formKey = GlobalKey<FormState>();
  String? gender;
  String? weight;
  String? height;
  String? age;
  void _update() {
    widget.onChanged(gender: gender, weight: weight, height: height, age: age);
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(title: 'Gender' , style: Styles.textStyle17,),
            SizedBox(height: SizeConfig.defaultSize! * 1),
            GenderField(
              gender: gender,
              onChanged: (val) {
                setState(() => gender = val);
                _update();
              },
            ),
            SizedBox(height: SizeConfig.defaultSize! * 2),
             CustomText(title: 'Weight', style: Styles.textStyle17),
            SizedBox(height: SizeConfig.defaultSize! * 1),
            WeightField(
              weight: weight,
              onChanged: (val) {
                setState(() => weight = val);
                _update();
              },
            ),
            SizedBox(height: SizeConfig.defaultSize! * 2),
             CustomText(title: 'Height', style: Styles.textStyle17),
            SizedBox(height: SizeConfig.defaultSize! * 1),
            HeightField(
              height: height,
              onChanged: (val) {
                setState(() => height = val);
                _update();
              },
            ),
            SizedBox(height: SizeConfig.defaultSize! * 2),
             CustomText(title: 'Age', style: Styles.textStyle17),
            SizedBox(height: SizeConfig.defaultSize! * 1),
            AgeField(
              age: age,
              onChanged: (val) {
                setState(() => age = val);
                _update();
              },
            ),
          ],
        ),
      ),
    );
  }
}
