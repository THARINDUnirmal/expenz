import 'package:flutter/material.dart';

enum ExpenseCategories {
  shopping,
  subscriptions,
  food,
  health,
  transport,
}

//category images
final Map<ExpenseCategories, String> expenseCategoryImages = {
  ExpenseCategories.food: "assets/images/restaurant.png",
  ExpenseCategories.transport: "assets/images/car.png",
  ExpenseCategories.health: "assets/images/health.png",
  ExpenseCategories.shopping: "assets/images/bag.png",
  ExpenseCategories.subscriptions: "assets/images/bill.png",
};

//category colors
final Map<ExpenseCategories, Color> expenseCategoryColors = {
  ExpenseCategories.food: const Color(0xFFE57373),
  ExpenseCategories.transport: const Color(0xFF81C784),
  ExpenseCategories.health: const Color(0xFF64B5F6),
  ExpenseCategories.shopping: const Color(0xFFFFD54F),
  ExpenseCategories.subscriptions: const Color(0xFF9575CD),
};

final class Expense {
  final int id;
  final String title;
  final double amount;
  final ExpenseCategories category;
  final DateTime date;
  final DateTime time;
  final String description;

  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    required this.time,
    required this.description,
  });
}
