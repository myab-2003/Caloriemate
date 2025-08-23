import 'package:caloriemate/Config/routes_manager.dart';
import 'package:caloriemate/Core/Utils/constants.dart';
import 'package:caloriemate/Features/create_order/Manager/food_cubit.dart';
import 'package:caloriemate/Features/create_order/data/Repo/food_repo.dart';
import 'package:caloriemate/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main()  async {
  runApp(const Caloriemate());
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

}

class Caloriemate extends StatelessWidget {
  const Caloriemate({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FoodCubit(FoodRepo())
                ..loadAllFoods(['vegetables', 'meat', 'carb']),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: RouterManager.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: KAtractivecolor,
          textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
