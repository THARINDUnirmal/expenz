import 'package:expenz_app/utils/colors.dart';
import 'package:flutter/material.dart';

class OnbordingWidget extends StatelessWidget {
  final String cardImageUrl;
  final String cardTitile;
  final String cardDescription;

  const OnbordingWidget({
    super.key,
    required this.cardImageUrl,
    required this.cardTitile,
    required this.cardDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            cardImageUrl,
            width: 350,
            fit: BoxFit.cover,
          ),
          Text(
            cardTitile,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w800,
              color: kBlack,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            cardDescription,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: kGrey,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
