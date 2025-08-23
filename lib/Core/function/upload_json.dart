import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

Future<void> uploadJsonToFirestore(
  String assetPath,
  String collectionName,
) async {
  // 1. اقرأ الملف من assets
  String jsonString = await rootBundle.loadString(assetPath);

  // 2. اعمل decode للـ JSON
  List<dynamic> items = json.decode(jsonString);

  // 3. ارفع كل عنصر في Collection
  for (var item in items) {
    await FirebaseFirestore.instance.collection(collectionName).add(item);
  }

  print("✅ Data from $assetPath uploaded to $collectionName!");
}
