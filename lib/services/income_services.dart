import 'dart:convert';

import 'package:expenz_app/models/income%20_categories.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IncomeServices {
  static const _incomeKey = "income";

  //function to save income object
  Future<void> saveIncome(Income income, BuildContext context) async {
    try {
      //get saved income data
      SharedPreferences pref = await SharedPreferences.getInstance();
      List<String>? inIncomeData = pref.getStringList(_incomeKey);

      //convert to json object to income object
      List<Income> incomeObject = [];

      //convertion
      if (inIncomeData != null) {
        incomeObject =
            inIncomeData.map((e) => Income.formJson(json.decode(e))).toList();
      }

      //add new income object
      incomeObject.add(income);

      //now convert income object to json object for save the shared preferences

      List<String> updatedIncomeData = [];

      //convertion
      updatedIncomeData =
          incomeObject.map((e) => json.encode(e.toJson())).toList();

      //save the data in shared preferences
      await pref.setStringList(_incomeKey, updatedIncomeData);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Income Data added succsess"),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Error on adding Income..!"),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  //load all saved income data
  Future<List<Income>> loadIncome() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String>? getAllIncome = pref.getStringList(_incomeKey);

    List<Income> incomeObjectList = [];

    //convert to income object
    if (getAllIncome != null) {
      incomeObjectList =
          getAllIncome.map((e) => Income.formJson(json.decode(e))).toList();
    }

    return incomeObjectList;
  }

  //remove income data in shared preferenses
  Future<void> removeIncome(int id, BuildContext context) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      List<String>? inIncomeList = pref.getStringList(_incomeKey);

      //convert string data to income object
      List<Income> incomeObjectList = [];

      if (inIncomeList != null) {
        incomeObjectList =
            inIncomeList.map((e) => Income.formJson(json.decode(e))).toList();
      }

      //remove income object
      incomeObjectList.removeWhere((element) => element.id == id);

      //convert string to income object
      List<String> updatedIncomeList = [];

      //convertion
      updatedIncomeList =
          incomeObjectList.map((e) => json.encode(e.toJson())).toList();

      //save in preferenses
      await pref.setStringList(_incomeKey, updatedIncomeList);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Income Delete Succsess...!"),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Error on Income Delete !"),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  //remove expenses data
  Future<void> clearAllIncomesData(BuildContext context) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.remove(_incomeKey);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Log out Succsess"),
          ),
        );
      }
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
