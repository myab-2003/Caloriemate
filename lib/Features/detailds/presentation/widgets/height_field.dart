import 'package:caloriemate/Core/Utils/size_confige.dart';
import 'package:caloriemate/Core/Utils/styles.dart';
import 'package:caloriemate/Features/detailds/presentation/widgets/custom_input_decoration.dart';
import 'package:flutter/material.dart';

class HeightField extends StatelessWidget {
  final String? height;
  final void Function(String?) onChanged;

  const HeightField({super.key, required this.height, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return TextFormField(
      decoration: CustomInputDecoration.build().copyWith(
        hintText: 'Enter your height',
        hintStyle: Styles.textStyle20,
        suffixIcon: IntrinsicWidth(
          child: Center(child: Text("Cm", style: Styles.textStyle17)),
        ),
      ),
      style: Styles.textStyle16,
      keyboardType: TextInputType.number,
      onChanged: (val) => onChanged(val.isEmpty ? null : val),
      validator: (val) =>
          val == null || val.isEmpty ? "Enter your height" : null,
    );
  }
}
