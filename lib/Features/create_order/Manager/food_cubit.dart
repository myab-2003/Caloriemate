import 'package:caloriemate/Features/create_order/Manager/food_state.dart';
import 'package:caloriemate/Features/create_order/data/Model/foodmodel.dart';
import 'package:caloriemate/Features/create_order/data/Repo/food_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodCubit extends Cubit<FoodState> {
  final FoodRepo repository;

  FoodCubit(this.repository) : super(FoodInitial());

  Future<void> loadAllFoods(List<String> collections) async {
    emit(FoodLoading());
    try {
      Map<String, List<FoodModel>> allFoods = {};
      for (var col in collections) {
        final foods = await repository.fetchFoods(col);
        allFoods[col] = foods;
      }
      emit(FoodSuccessMultiple(allFoods));
    } catch (e) {
      emit(FoodFailure(e.toString()));
    }
  }
}
