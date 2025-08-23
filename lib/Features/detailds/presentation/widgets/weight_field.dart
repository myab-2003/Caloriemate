import 'package:caloriemate/Core/Utils/size_confige.dart';
import 'package:caloriemate/Core/Utils/styles.dart';
import 'package:caloriemate/Features/detailds/presentation/widgets/custom_input_decoration.dart';
import 'package:flutter/material.dart';
class WeightField extends StatelessWidget {
  final String? weight;
  final void Function(String?) onChanged;
  const WeightField({super.key, required this.weight, required this.onChanged});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return TextFormField(
      decoration: CustomInputDecoration.build().copyWith(
        hintText: 'Enter your Weight',
        hintStyle: Styles.textStyle20,
        suffixIcon: IntrinsicWidth(
          child: Center(child: Text("Kg", style: Styles.textStyle17)),
        ),
      ),
      style: Styles.textStyle16,
      keyboardType: TextInputType.number,
      onChanged: (val) => onChanged(val.isEmpty ? null : val),
      validator: (val) =>
          val == null || val.isEmpty ? "Enter your weight" : null,
    );
  }
}
