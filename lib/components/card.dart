import 'package:flutter/material.dart';

class EachCard extends StatelessWidget {

  final Color customColor;
  final Widget cardChild;
  const EachCard({super.key,  required this.customColor, required this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: customColor,
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: cardChild,
    );
  }
}

