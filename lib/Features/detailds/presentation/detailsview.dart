import 'package:caloriemate/Core/Utils/size_confige.dart';
import 'package:caloriemate/Core/Utils/widgets/Custom_appbar.dart';
import 'package:caloriemate/Features/detailds/presentation/view/detailsbody.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: CustomAppbar(title: "Enter your details"),
      resizeToAvoidBottomInset: false,
      body: Detailsbody(), 
    );
  }
}