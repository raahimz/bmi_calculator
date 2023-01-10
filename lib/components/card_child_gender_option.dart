import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';

class CardChildGenderOption extends StatelessWidget {
  final IconData icon;
  final String text;

  const CardChildGenderOption(this.icon, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          icon,
          color: Colors.white,
          size: 80,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
