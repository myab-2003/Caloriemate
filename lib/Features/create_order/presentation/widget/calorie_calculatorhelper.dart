class CalorieCalculatorHelper {
  static double calculateCalories({
    required String gender,
    required String weight,
    required String height,
    required String age,
  }) {
    final double w = double.tryParse(weight) ?? 0;
    final double h = double.tryParse(height) ?? 0;
    final double a = double.tryParse(age) ?? 0;

    if (gender.toLowerCase() == "female") {
      return 655.1 + (9.56 * w) + (1.85 * h) - (4.67 * a);
    } else {
      return 666.47 + (13.75 * w) + (5 * h) - (6.75 * a);
    }
  }
}
