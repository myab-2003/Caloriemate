import 'package:flutter/material.dart';

class Networkimage extends StatelessWidget {
  const Networkimage({super.key, required this.imageUrl , required this.h, required this.w});
  final String imageUrl;
  final double h;
  final double w;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          imageUrl,
          height:h,
          width: w,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
