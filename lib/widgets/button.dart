import 'package:expenz_app/utils/colors.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final Color buttonColor;
  final String buttonTitle;

  const Button({
    super.key,
    required this.buttonTitle,
    required this.buttonColor,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: widget.buttonColor,
      ),
      child: Center(
        child: Text(
          widget.buttonTitle,
          style: const TextStyle(
            color: kWhite,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
