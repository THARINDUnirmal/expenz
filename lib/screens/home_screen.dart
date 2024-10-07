import 'package:expenz_app/models/expense%20_categories.dart';
import 'package:expenz_app/models/income%20_categories.dart';
import 'package:expenz_app/services/user_services.dart';
import 'package:expenz_app/utils/colors.dart';
import 'package:expenz_app/widgets/expense_card.dart';
import 'package:expenz_app/widgets/expenz_widget.dart';
import 'package:expenz_app/widgets/income_card.dart';
import 'package:expenz_app/widgets/line_chart.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomeScreen extends StatefulWidget {
  final List<Expense> allExpensesList;
  final List<Income> allIncomeList;

  const HomeScreen({
    super.key,
    required this.allExpensesList,
    required this.allIncomeList,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userName = "";
  double expenseTotal = 0;
  double incomeTotal = 0;
  @override
  void initState() {
    UserServices.getUserDetails().then((value) {
      setState(() {
        if (value["userName"] != null) {
          userName = value["userName"]!;
        }
      });
    });
    setState(() {
      //Total Expenses amount
      for (var i = 0; i < widget.allExpensesList.length; i++) {
        expenseTotal += widget.allExpensesList[i].amount;
      }

      //Total Incomes amount
      for (var i = 0; i < widget.allIncomeList.length; i++) {
        incomeTotal += widget.allIncomeList[i].amount;
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              height: MediaQuery.of(context).size.height * 0.37,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                color: kMainColor.withOpacity(0.37),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 5,
                            color: kWhite,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            "assets/images/user1.jpg",
                            width: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GradientText("Wellcome !",
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                              colors: const [
                                Color.fromARGB(255, 37, 33, 243),
                                Color.fromARGB(255, 224, 22, 231),
                                Colors.red,
                              ]),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text(
                              userName,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.notifications,
                        size: 30,
                        color: kMainColor,
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ExpenzWidget(
                          cardImageUrl: "assets/images/income.png",
                          cardColor: kGreen,
                          cardTitle: "Income",
                          cardPrice: incomeTotal,
                        ),
                        ExpenzWidget(
                          cardImageUrl: "assets/images/expense.png",
                          cardColor: kRed,
                          cardTitle: "Expense",
                          cardPrice: expenseTotal,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Spend Frequency",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: kBlack,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  const LineChartSample(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  const Text(
                    "Recent Transaction",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: kBlack,
                    ),
                  ),
                  Column(
                    children: [
                      widget.allExpensesList.isEmpty
                          ? const Text(
                              "No Expenses added yet, Please add some Expense to see here !",
                              style: TextStyle(
                                color: kGrey,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.center,
                            )
                          : ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: widget.allExpensesList.length,
                              itemBuilder: (context, index) {
                                Expense allExpenses =
                                    widget.allExpensesList[index];
                                return ExpenseCard(
                                  cardTitle: allExpenses.title,
                                  description: allExpenses.description,
                                  cardImage: allExpenses.category,
                                  amount: allExpenses.amount,
                                  time: allExpenses.time,
                                );
                              },
                            ),
                      widget.allIncomeList.isEmpty
                          ? const Text(
                              "Please add some Incomes to see here !",
                              style: TextStyle(
                                color: kGrey,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.center,
                            )
                          : ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: widget.allIncomeList.length,
                              itemBuilder: (context, index) {
                                Income allIncomes = widget.allIncomeList[index];
                                return IncomeCard(
                                  cardTitle: allIncomes.title,
                                  cardDescription: allIncomes.description,
                                  cardImage: allIncomes.category,
                                  amount: allIncomes.amount,
                                  time: allIncomes.time,
                                );
                              },
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
