import 'package:cloud_firestore/cloud_firestore.dart';
import '../Model/foodmodel.dart';

class FoodRepo {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<FoodModel>> fetchFoods(String collectionName) async {
    final querySnapshot = await firestore.collection(collectionName).get();

    return querySnapshot.docs.map((doc) {
      return FoodModel.fromFirestore(doc.data(), doc.id);
    }).toList();
  }
}
