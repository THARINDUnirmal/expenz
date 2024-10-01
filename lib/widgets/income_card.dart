import 'package:expenz_app/models/income%20_categories.dart';
import 'package:expenz_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class IncomeCard extends StatelessWidget {
  final String cardTitle;
  final String cardDescription;
  final DateTime time;
  final IncomeCategories cardImage;
  final double amount;

  const IncomeCard({
    super.key,
    required this.cardImage,
    required this.cardTitle,
    required this.cardDescription,
    required this.time,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kWhite,
        boxShadow: const [
          BoxShadow(
            blurRadius: 1,
            color: kGrey,
            offset: Offset(0, 1),
          )
        ],
      ),
      child: Row(
        children: [
          // Card image
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset(
              incomeCategoryImages[cardImage]!,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 140,
                child: Text(
                  cardTitle,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kBlack,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                width: 130,
                child: Text(
                  cardDescription,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: kGrey.withOpacity(0.8),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          const Spacer(),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "-RS ${amount.toString()}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kRed,
                ),
              ),
              Text(
                DateFormat.jm().format(time),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: kGrey.withOpacity(0.8),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
