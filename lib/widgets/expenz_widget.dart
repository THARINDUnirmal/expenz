import 'package:expenz_app/utils/colors.dart';
import 'package:flutter/material.dart';

class ExpenzWidget extends StatefulWidget {
  final Color cardColor;
  final String cardImageUrl;
  final String cardTitle;
  final int cardPrice;

  const ExpenzWidget({
    super.key,
    required this.cardColor,
    required this.cardImageUrl,
    required this.cardTitle,
    required this.cardPrice,
  });

  @override
  State<ExpenzWidget> createState() => _ExpenzWidgetState();
}

class _ExpenzWidgetState extends State<ExpenzWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.43,
      decoration: BoxDecoration(
        color: widget.cardColor,
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
              widget.cardImageUrl,
              width: MediaQuery.of(context).size.width * 0.1,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.03,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.cardTitle,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: kWhite,
                ),
              ),
              Text(
                "\$${widget.cardPrice.toString()}",
                style: const TextStyle(
                  fontSize: 20,
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
