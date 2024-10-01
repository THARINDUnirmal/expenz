import 'package:expenz_app/models/expense%20_categories.dart';
import 'package:expenz_app/models/income%20_categories.dart';
import 'package:expenz_app/utils/colors.dart';
import 'package:expenz_app/widgets/expense_card.dart';
import 'package:expenz_app/widgets/income_card.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatefulWidget {
  final void Function(Income) removeIncome;
  final List<Income> incomeList;
  final void Function(Expense) deleteExpense;
  final List<Expense> expensesList;

  const TransactionScreen({
    super.key,
    required this.expensesList,
    required this.deleteExpense,
    required this.incomeList,
    required this.removeIncome,
  });

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "See your financial report",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  color: kMainColor,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              const Text(
                "Expenses",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: kBlack,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: widget.expensesList.length,
                  itemBuilder: (context, index) {
                    Expense indexExpense = widget.expensesList[index];

                    return Dismissible(
                      key: ValueKey(indexExpense),
                      direction: DismissDirection.startToEnd,
                      onDismissed: (direction) {
                        setState(() {
                          widget.deleteExpense(indexExpense);
                        });
                      },
                      child: ExpenseCard(
                        cardTitle: indexExpense.title,
                        description: indexExpense.description,
                        cardImage: indexExpense.category,
                        amount: indexExpense.amount,
                        time: indexExpense.time,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              const Text(
                "Income",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: kBlack,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: widget.incomeList.length,
                  itemBuilder: (context, index) {
                    Income income = widget.incomeList[index];

                    return Dismissible(
                      key: ValueKey(income),
                      direction: DismissDirection.startToEnd,
                      onDismissed: (direction) {
                        setState(() {
                          widget.removeIncome(income);
                        });
                      },
                      child: IncomeCard(
                        cardImage: income.category,
                        cardTitle: income.title,
                        cardDescription: income.description,
                        time: income.time,
                        amount: income.amount,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
