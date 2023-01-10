import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/card_child_gender_option.dart';
import 'package:bmi_calculator/components/mycard.dart';
import 'results_page.dart';
import 'package:bmi_calculator/components/bottom_container_button.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 70;
  int age = 24;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarTitle),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Mycard(
                    selectedGender == Gender.male ? true : false,
                    const CardChildGenderOption(FontAwesomeIcons.mars, 'MALE'),
                    () => {
                      setState(() {
                        selectedGender = Gender.male;
                      })
                    },
                  ),
                ),
                Expanded(
                  child: Mycard(
                    selectedGender == Gender.female ? true : false,
                    const CardChildGenderOption(
                        FontAwesomeIcons.venus, 'FEMALE'),
                    () => {
                      setState(() {
                        selectedGender = Gender.female;
                      })
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Mycard(
              true,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: boldDetailTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    max: 210,
                    min: 120,
                    onChanged: (value) {
                      setState(() {
                        height = value.round();
                      });
                    },
                    activeColor: const Color(sliderActiveColor),
                    inactiveColor: const Color(sliderInactiveColor),
                  ),
                ],
              ),
              () => {},
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Mycard(
                    true,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: labelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: boldDetailTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(FontAwesomeIcons.minus, () {
                              setState(() {
                                age--;
                              });
                            }),
                            const SizedBox(
                              width: 8,
                            ),
                            RoundIconButton(FontAwesomeIcons.plus, () {
                              setState(() {
                                age++;
                              });
                            }),
                          ],
                        ),
                      ],
                    ),
                    () => {},
                  ),
                ),
                Expanded(
                  child: Mycard(
                    true,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: labelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: boldDetailTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(FontAwesomeIcons.minus, () {
                              setState(() {
                                weight--;
                              });
                            }),
                            const SizedBox(
                              width: 8,
                            ),
                            RoundIconButton(FontAwesomeIcons.plus, () {
                              setState(() {
                                weight++;
                              });
                            }),
                          ],
                        ),
                      ],
                    ),
                    () => {},
                  ),
                ),
              ],
            ),
          ),
          BottomContainerButton(() {
            CalculatorBrain calc = CalculatorBrain(weight, height);

            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ResultsPage(
                      calc.calculateBMI(),
                      calc.getResult(),
                      calc.getInterpretation(),
                      calc.getColor())),
            );
          }, 'CALCULATE'),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPress;

  const RoundIconButton(this.icon, this.onPress, {super.key});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => onPress(),
      fillColor: const Color(0xFF4C4F5E),
      textStyle: const TextStyle(
        color: Colors.white,
      ),
      constraints: const BoxConstraints.tightFor(
        width: 54,
        height: 54,
      ),
      elevation: 2,
      shape: const CircleBorder(),
      child: FaIcon(icon),
    );
  }
}
