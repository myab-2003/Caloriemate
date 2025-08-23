import 'package:caloriemate/Core/Utils/size_confige.dart';
import 'package:flutter/material.dart';

class MainCustombuttons extends StatelessWidget {
  const MainCustombuttons({
    super.key,
    required this.buttonname,
    required this.OnTap,
    required this.color,
  });
  final String buttonname;
  final VoidCallback OnTap;
  final Color color;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 2),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: OnTap,
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: SizeConfig.defaultSize! * 6,
            width: double.infinity,
            child: Center(
              child: Text(
                buttonname,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
