import 'package:expenz_app/utils/colors.dart';
import 'package:flutter/material.dart';

class LogoPage extends StatelessWidget {
  const LogoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/logo.png",
          width: MediaQuery.of(context).size.width * 0.35,
          fit: BoxFit.cover,
        ),
        const Text(
          "Expenz",
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.w800,
            color: kMainColor,
          ),
        )
      ],
    );
  }
}
