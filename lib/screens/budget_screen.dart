import 'package:expenz_app/models/expense%20_categories.dart';
import 'package:expenz_app/models/income%20_categories.dart';
import 'package:expenz_app/utils/colors.dart';
import 'package:expenz_app/widgets/pie_chart_widget.dart';
import 'package:flutter/material.dart';

class BudgetScreen extends StatefulWidget {
  final Map<ExpenseCategories, double> expensesAmount;
  final Map<IncomeCategories, double> incomeAmount;

  const BudgetScreen({
    super.key,
    required this.expensesAmount,
    required this.incomeAmount,
  });

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  int _selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Budget Page",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectIndex = 0;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      width: MediaQuery.of(context).size.width * 0.41,
                      decoration: BoxDecoration(
                        color: _selectIndex == 0 ? kMainColor : kWhite,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Text(
                          "Expense",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: _selectIndex == 0 ? kWhite : kBlack,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectIndex = 1;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      width: MediaQuery.of(context).size.width * 0.41,
                      decoration: BoxDecoration(
                        color: _selectIndex == 1 ? kMainColor : kWhite,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Text(
                          "Income",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: _selectIndex == 1 ? kWhite : kBlack,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),

          //pie chart
          PieChartWidget(
            isExpense: _selectIndex == 0,
            expensesAmounts: widget.expensesAmount,
            incomeAmounts: widget.incomeAmount,
          ),
        ],
      ),
    );
  }
}
