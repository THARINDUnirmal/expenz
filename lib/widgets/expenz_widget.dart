import 'package:expenz_app/utils/colors.dart';
import 'package:flutter/material.dart';

class ExpenzWidget extends StatelessWidget {
  final Color cardColor;
  final String cardImageUrl;
  final String cardTitle;
  final double cardPrice;

  const ExpenzWidget({
    super.key,
    required this.cardColor,
    required this.cardImageUrl,
    required this.cardTitle,
    required this.cardPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      width: MediaQuery.of(context).size.width * 0.46,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset(
              cardImageUrl,
              width: MediaQuery.of(context).size.width * 0.1,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.015,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cardTitle,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: kWhite,
                ),
              ),
              Text(
                "Rs $cardPrice",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: kWhite,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
