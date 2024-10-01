import 'package:expenz_app/models/expense%20_categories.dart';
import 'package:expenz_app/utils/colors.dart';
import 'package:expenz_app/widgets/expense_card.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatefulWidget {
  final List<Expense> expensesList;

  const TransactionScreen({
    super.key,
    required this.expensesList,
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
          padding: const EdgeInsets.all(10.0),
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
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Expenses",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: kBlack,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: widget.expensesList.length,
                  itemBuilder: (context, index) {
                    Expense indexExpense = widget.expensesList[index];
                    return ExpenseCard(
                      cardTitle: indexExpense.title,
                      description: indexExpense.description,
                      cardImage: indexExpense.category,
                      amount: indexExpense.amount,
                      time: indexExpense.time,
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
