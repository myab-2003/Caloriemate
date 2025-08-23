class FoodModel {
  final String id;
  final String foodName;
  final int calories;
  final String imageUrl;

  FoodModel({
    required this.id,
    required this.foodName,
    required this.calories,
    required this.imageUrl,
  });

  factory FoodModel.fromFirestore(Map<String, dynamic> data, String id) {
    return FoodModel(
      id: id,
      foodName: data['food_name'] ?? '',
      calories: data['calories'] ?? 0,
      imageUrl: data['image_url'] ?? '',
    );
  }
}
