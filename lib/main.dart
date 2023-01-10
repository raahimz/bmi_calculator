import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'package:bmi_calculator/constants.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(primaryColor),
        ),
        scaffoldBackgroundColor: const Color(scaffoldBackgroundColor),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Color(bodyMediumTextColor)),
        ),
      ),
      home: const InputPage(),
    );
  }
}
