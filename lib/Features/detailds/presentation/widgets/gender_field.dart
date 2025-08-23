import 'package:caloriemate/Core/Utils/constants.dart';
import 'package:caloriemate/Core/Utils/size_confige.dart';
import 'package:caloriemate/Core/Utils/styles.dart';
import 'package:caloriemate/Features/detailds/presentation/widgets/custom_input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class GenderField extends StatelessWidget {
  final String? gender;
  final void Function(String?) onChanged;
  const GenderField({super.key, required this.gender, required this.onChanged});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final highlight = Colors.orange.withOpacity(0.12);
    const itemsList = ["Male", "Female"];
    return DropdownButtonFormField2<String>(
      value: gender,
      isExpanded: true,
      decoration: CustomInputDecoration.build().copyWith(
        hintText: 'Choose your gender',
        hintStyle: Styles.textStyle20,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 16,
        ),
      ),
      onChanged: onChanged,
      validator: (val) => val == null ? "Please select your gender" : null,
      dropdownStyleData: DropdownStyleData(
        maxHeight: 300,
        decoration: BoxDecoration(
          color: Kwhitecolor,
          borderRadius: BorderRadius.circular(12),
        ),
        direction: DropdownDirection.textDirection,
      ),
      buttonStyleData: const ButtonStyleData(
        // height: 30,
        width: double.infinity,
        padding: EdgeInsets.zero,
      ),
      style: Styles.textStyle16,
      iconStyleData: IconStyleData(
        icon: Transform.rotate(
          angle: -1.5708,
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: KbackColor,
            size: 18,
          ),
        ),
      ),
      selectedItemBuilder: (context) => itemsList
          .map(
            (e) => Align(
              alignment: Alignment.centerLeft,
              child: Text(e, style: Styles.textStyle16),
            ),
          )
          .toList(),
      items: itemsList.map((value) {
        final isSelected = value == gender;
        return DropdownMenuItem<String>(
          value: value,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            decoration: BoxDecoration(
              color: isSelected ? highlight : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value,
                    style: Styles.textStyle16.copyWith(
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w400,
                    ),
                  ),
                ),
                if (isSelected)
                  const Icon(Icons.check, color: Colors.orange, size: 20),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
