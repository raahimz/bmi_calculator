import 'package:flutter/material.dart';
import '../constants.dart';

class Mycard extends StatelessWidget {
  final bool isActive;
  final Widget cardChild;
  final Function onTap;

  const Mycard(this.isActive, this.cardChild, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Color(isActive ? activeCardColour : inactiveCardColour),
          borderRadius: BorderRadius.circular(10),
        ),
        child: cardChild,
      ),
    );
  }
}
