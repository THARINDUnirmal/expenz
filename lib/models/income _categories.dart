// ignore_for_file: file_names

import 'package:flutter/material.dart';

enum IncomeCategories {
  salary,
  freelance,
  passive,
  sales,
}

//category images
final Map<IncomeCategories, String> incomeCategoryImages = {
  IncomeCategories.freelance: "assets/images/freelance.png",
  IncomeCategories.passive: "assets/images/car.png",
  IncomeCategories.sales: "assets/images/health.png",
  IncomeCategories.salary: "assets/images/salary.png",
};

//category colors
final Map<IncomeCategories, Color> incomeCategoryColors = {
  IncomeCategories.freelance: const Color(0xFFE57373),
  IncomeCategories.passive: const Color(0xFF81C784),
  IncomeCategories.sales: const Color(0xFF64B5F6),
  IncomeCategories.salary: const Color(0xFFFFD54F),
};

final class Income {
  final int id;
  final String title;
  final double amount;
  final IncomeCategories category;
  final DateTime date;
  final DateTime time;
  final String description;

  Income({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    required this.time,
    required this.description,
  });

  //convert to income object to json object

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "amount": amount,
      "category": category.index,
      "date": date.toIso8601String(),
      "time": time.toIso8601String(),
      "description": description
    };
  }

  //convert to json object to a income object

  factory Income.formJson(Map<String, dynamic> json) {
    return Income(
        id: json["id"],
        title: json["title"],
        amount: json["amount"],
        category: IncomeCategories.values[json["category"]],
        date: DateTime.parse(json["date"]),
        time: DateTime.parse(json["time"]),
        description: json["description"]);
  }
}
