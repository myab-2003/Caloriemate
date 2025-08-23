import 'dart:math' as math;

import 'package:caloriemate/Core/Utils/constants.dart';
import 'package:caloriemate/Core/Utils/size_confige.dart';
import 'package:caloriemate/Core/Utils/styles.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key, required this.title});
  final String title;

  @override
  Size get preferredSize => Size.fromHeight(SizeConfig.defaultSize! * 8);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Kwhitecolor,
      elevation: 0,
      centerTitle: true,
      leading: Padding(
        padding: EdgeInsets.only(
          left: SizeConfig.defaultSize! * 2,
        ),
        child: IconButton(
          icon: Transform.rotate(
            angle: math.pi / 2, // 👈 كده بقت شبه زر الرجوع
            child: Icon(
              Icons.arrow_drop_down_outlined,
              color: KbackColor,
              size: 35,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      title: Padding(
        padding: EdgeInsets.only(
          top: SizeConfig.defaultSize! * 2,
          left: SizeConfig.defaultSize! * 1,
        ),
        child: Text(
          title,
          style: Styles.textStyle15.copyWith(color: KbackColor),
        ),
      ),
    );
  }
}
