import 'package:flutter/material.dart';
import '../constants.dart';

class BottomContainerButton extends StatelessWidget {
  final Function onTap;
  final String title;

  const BottomContainerButton(this.onTap, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: 72,
        width: double.infinity,
        color: const Color(sliderActiveColor),
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.only(bottom: 12),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
