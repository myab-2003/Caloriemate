import 'package:caloriemate/Core/Utils/constants.dart';
import 'package:caloriemate/Core/Utils/size_confige.dart';
import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback? onPressed;
  final String text;

  const NextButton({
    super.key,
    required this.isEnabled,
    this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 2),
      child: Material(
        color: isEnabled ? kPrimaryColor : Kbuttoncolor,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: onPressed ?? null,
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: SizeConfig.defaultSize! * 6,
            width: double.infinity,
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: isEnabled ? Kbuttoncolor : Kgreycolor,
                  fontSize: 16,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
