import 'package:bmi_calculator/components/mycard.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/bottom_container_button.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(this.bmi, this.result, this.interpretation, this.color,
      {super.key});

  final String bmi, result, interpretation;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarTitle),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Your BMI',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 48,
              ),
            ),
          ),
          Expanded(
            child: Mycard(
              true,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    result.toUpperCase(),
                    style: TextStyle(
                      color: color,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    bmi,
                    style: const TextStyle(
                      fontSize: 128,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      interpretation,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              () {},
            ),
          ),
          BottomContainerButton(() {
            Navigator.pop(context);
          }, 'RE-CALCULATE'),
        ],
      ),
    );
  }
}
