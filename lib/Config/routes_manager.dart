import 'package:caloriemate/Config/routes.dart';
import 'package:caloriemate/Features/Welcome_Screen/presentation/welcomeview.dart';
import 'package:caloriemate/Features/create_order/data/Model/foodmodel.dart';
import 'package:caloriemate/Features/create_order/presentation/create_orderview.dart';
import 'package:caloriemate/Features/detailds/presentation/detailsview.dart';
import 'package:caloriemate/Features/order_summary/presentation/order_summaryview.dart';
import 'package:go_router/go_router.dart';

abstract class RouterManager {
  static final router = GoRouter(
    initialLocation: AppRouter.kWelcome,
    routes : [
      GoRoute(
        path: AppRouter.kWelcome,
        builder: (context, state) => const WelcomeView(),
      ),
      GoRoute(
        path: AppRouter.kDetailsview,
        builder: (context, state) => const DetailsView(),
      ),
      GoRoute(
        path: AppRouter.kcreateorder,
        builder: (context, state) {
          final args = state.extra as Map<String, dynamic>;
          return Createorderview(
            gender: args['gender'],
            weight: args['weight'],
            height: args['height'],
            age: args['age'],
          );
        },
    ),
   GoRoute(
        path: AppRouter.kordersummary,
        builder: (context, state) {
          final args = state.extra as Map<String, dynamic>;

          return OrderSummaryview(
            consumedCalories: args['consumedCalories'] as int,
            allowedCalories: args['allowedCalories'] as int,
            totalPrice: (args['totalPrice'] as num).toDouble(),
            selectedFoods: Map<FoodModel, int>.from(
              args['selectedFoods'] as Map,
            ),
          );
        },
      ),


    ],
  );
}
