import 'package:caloriemate/Features/create_order/data/Model/foodmodel.dart';

abstract class FoodState {}

class FoodInitial extends FoodState {}

class FoodLoading extends FoodState {}

class FoodSuccess extends FoodState {
  final List<FoodModel> foods;
  FoodSuccess(this.foods);
}

class FoodSuccessMultiple extends FoodState {
  final Map<String, List<FoodModel>> allFoods;
  FoodSuccessMultiple(this.allFoods);
}

class FoodFailure extends FoodState {
  final String message;
  FoodFailure(this.message);
}
