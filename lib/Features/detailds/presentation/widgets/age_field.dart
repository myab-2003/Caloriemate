import 'package:caloriemate/Core/Utils/size_confige.dart';
import 'package:caloriemate/Core/Utils/styles.dart';
import 'package:caloriemate/Features/detailds/presentation/widgets/custom_input_decoration.dart';
import 'package:flutter/material.dart';

class AgeField extends StatelessWidget {
  final String? age;
  final void Function(String?) onChanged;

  const AgeField({super.key, required this.age, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return TextFormField(
      decoration: CustomInputDecoration.build().copyWith(
        hintText: 'Enter your age',
        hintStyle: Styles.textStyle20,
      ),
      style: Styles.textStyle16,
      keyboardType: TextInputType.number,
      onChanged: (val) => onChanged(val.isEmpty ? null : val),
      validator: (val) => val == null || val.isEmpty ? "Enter your age" : null,
    );
  }
}
