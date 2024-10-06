import 'package:flutter/material.dart';

class ProfileScreenWidget extends StatelessWidget {
  final String text;
  final IconData iconType;
  final Color backColor;

  const ProfileScreenWidget({
    super.key,
    required this.text,
    required this.iconType,
    required this.backColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
        top: 10,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: backColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Icon(
                iconType,
                size: 30,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
