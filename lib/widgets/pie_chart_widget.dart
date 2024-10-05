import 'package:expenz_app/models/expense%20_categories.dart';
import 'package:expenz_app/models/income%20_categories.dart';
import 'package:expenz_app/utils/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class PieChartWidget extends StatefulWidget {
  final Map<ExpenseCategories, double> expensesAmounts;
  final Map<IncomeCategories, double> incomeAmounts;
  final bool isExpense;

  const PieChartWidget({
    super.key,
    required this.expensesAmounts,
    required this.incomeAmounts,
    required this.isExpense,
  });

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  List<PieChartSectionData> chartDatas() {
    if (widget.isExpense) {
      return [
        PieChartSectionData(
          color: expenseCategoryColors[ExpenseCategories.food],
          radius: 60,
          value: widget.expensesAmounts[ExpenseCategories.food] ?? 0,
          showTitle: false,
        ),
        PieChartSectionData(
          color: expenseCategoryColors[ExpenseCategories.health],
          radius: 60,
          value: widget.expensesAmounts[ExpenseCategories.health] ?? 0,
          showTitle: false,
        ),
        PieChartSectionData(
          color: expenseCategoryColors[ExpenseCategories.shopping],
          radius: 60,
          value: widget.expensesAmounts[ExpenseCategories.shopping] ?? 0,
          showTitle: false,
        ),
        PieChartSectionData(
          color: expenseCategoryColors[ExpenseCategories.subscriptions],
          radius: 60,
          value: widget.expensesAmounts[ExpenseCategories.subscriptions] ?? 0,
          showTitle: false,
        ),
        PieChartSectionData(
          color: expenseCategoryColors[ExpenseCategories.transport],
          radius: 60,
          value: widget.expensesAmounts[ExpenseCategories.transport] ?? 0,
          showTitle: false,
        ),
        PieChartSectionData(
          color: expenseCategoryColors[ExpenseCategories.food],
          radius: 60,
          value: widget.expensesAmounts[ExpenseCategories.food] ?? 0,
          showTitle: false,
        ),
      ];
    } else {
      return [
        PieChartSectionData(
          color: incomeCategoryColors[IncomeCategories.freelance],
          radius: 60,
          value: widget.incomeAmounts[IncomeCategories.freelance] ?? 0,
          showTitle: false,
        ),
        PieChartSectionData(
          color: incomeCategoryColors[IncomeCategories.passive],
          radius: 60,
          value: widget.incomeAmounts[IncomeCategories.passive] ?? 0,
          showTitle: false,
        ),
        PieChartSectionData(
          color: incomeCategoryColors[IncomeCategories.salary],
          radius: 60,
          value: widget.incomeAmounts[IncomeCategories.salary] ?? 0,
          showTitle: false,
        ),
        PieChartSectionData(
          color: incomeCategoryColors[IncomeCategories.sales],
          radius: 60,
          value: widget.incomeAmounts[IncomeCategories.sales] ?? 0,
          showTitle: false,
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final PieChartData piechartData = PieChartData(
      sections: chartDatas(),
      sectionsSpace: 0,
      borderData: FlBorderData(
        show: false,
      ),
      centerSpaceRadius: 70,
      startDegreeOffset: -90,
    );
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          PieChart(piechartData),
          widget.isExpense
              ? GradientText(
                  "Expenses",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  colors: const [
                    Colors.amber,
                    Colors.blue,
                    Colors.pink,
                  ],
                )
              : GradientText(
                  "Incomes",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  colors: const [
                    Color.fromARGB(255, 4, 236, 51),
                    Color.fromARGB(255, 169, 4, 198),
                    Colors.red,
                  ],
                ),
        ],
      ),
    );
  }
}
