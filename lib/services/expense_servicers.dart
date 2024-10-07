import 'dart:convert';

import 'package:expenz_app/models/expense%20_categories.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExpenseServicers {
  //expense list
  List<Expense> expensesList = [];

  //create expense key
  static const String _expenseKey = "expenses";

  Future<void> saveExpenses(Expense expenses, BuildContext context) async {
    try {
      SharedPreferences prif = await SharedPreferences.getInstance();
      List<String>? inExpensesList = prif.getStringList(_expenseKey);

      //create expenses object list
      List<Expense> expensesObjectList = [];

      //conver to json object to expense object and added to expense object list
      if (inExpensesList != null) {
        expensesObjectList = inExpensesList
            .map((e) => Expense.formJson(json.decode(e)))
            .toList();
      }

      //add the new expense data
      expensesObjectList.add(expenses);

      //convert to expenses object to json object , And it save the shared preferences !
      List<String> updatedList =
          expensesObjectList.map((e) => json.encode(e.toJson())).toList();

      //save this data in shared preferences
      await prif.setStringList(_expenseKey, updatedList);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Expense Data added succsess"),
          duration: Duration(seconds: 2),
        ));
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Error on adding Expenses..!"),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  //load expenses from shared prefrerenses

  Future<List<Expense>> loadExpenses() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String>? inExpensesDataList = pref.getStringList(_expenseKey);

    //create the list stroe the expenses data
    List<Expense> expenseList = [];

    if (inExpensesDataList != null) {
      expenseList = inExpensesDataList
          .map((e) => Expense.formJson(json.decode(e)))
          .toList();
    }
    return expenseList;
  }

  //delete expenses data in shared preferenses

  Future<void> removeExpensesData(int id, BuildContext context) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      List<String>? inExpensesList = pref.getStringList(_expenseKey);

      //convert string data to expense object
      List<Expense> expenseObjects = [];

      if (inExpensesList != null) {
        expenseObjects = inExpensesList
            .map((e) => Expense.formJson(json.decode(e)))
            .toList();
      }

      //delete expense data
      expenseObjects.removeWhere((expense) => expense.id == id);

      //convert again expense object to string
      List<String> updatedList = [];
      updatedList = expenseObjects.map((e) => json.encode(e.toJson())).toList();

      //save expense data
      await pref.setStringList(_expenseKey, updatedList);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Expenses Delete Succsess...!"),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Error on removing Expenses"),
          ),
        );
      }
    }
  }

  //remove expenses data
  Future<void> clearAllExpensesData(BuildContext context) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.remove(_expenseKey);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Log out failed"),
          ),
        );
      }
    }
  }
}
