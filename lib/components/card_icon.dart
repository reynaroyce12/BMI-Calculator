import 'package:flutter/material.dart';
import '../constants.dart';

class CardIcon extends StatelessWidget {

  final IconData customIcon;
  final String customText;
  const CardIcon({super.key, required this.customIcon, required this.customText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  <Widget> [
        Icon(customIcon, size: 70.0),
        const SizedBox(
          height: 15.0,
        ),
        Text(customText, style: kcustomTextStyles,)
      ],);
  }
}