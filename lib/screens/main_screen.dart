import 'package:expenz_app/models/expense%20_categories.dart';
import 'package:expenz_app/models/income%20_categories.dart';
import 'package:expenz_app/screens/add_screen.dart';
import 'package:expenz_app/screens/budget_screen.dart';
import 'package:expenz_app/screens/home_screen.dart';
import 'package:expenz_app/screens/profile_screen.dart';
import 'package:expenz_app/screens/transaction_screen.dart';
import 'package:expenz_app/services/expense_servicers.dart';
import 'package:expenz_app/services/income_services.dart';
import 'package:expenz_app/utils/colors.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //curunt index
  int cIndex = 4;

  //fetch all expenses data
  List<Expense> allExpenses = [];
  List<Income> allIncomes = [];
  double expensesAmount = 0;
  double incomeAmount = 0;

  //fetch all income data
  void fetchAllIncomes() async {
    List<Income> allIncome = await IncomeServices().loadIncome();

    setState(() {
      allIncomes = allIncome;
    });
  }

  //add income function
  void addIncome(Income income) async {
    IncomeServices().saveIncome(income, context);

    //add new income data for list
    setState(() {
      allIncomes.add(income);
    });
  }

  //fetch expenses function
  void fetchAllExpenses() async {
    List<Expense> listExpense = await ExpenseServicers().loadExpenses();

    setState(() {
      allExpenses = listExpense;
    });
  }

  //add expenses function
  void addExpenses(Expense newExpenses) {
    ExpenseServicers().saveExpenses(newExpenses, context);

    //addnew expenses for list
    setState(() {
      allExpenses.add(newExpenses);
    });
  }

  //remove expenses function
  void removeExpenses(Expense expense) {
    ExpenseServicers().removeExpensesData(expense.id, context);

    //update list
    setState(() {
      allExpenses.remove(expense);
    });
  }

  //remove income data function
  void deleteIncome(Income income) {
    IncomeServices().removeIncome(income.id, context);

    //update list
    setState(() {
      allIncomes.remove(income);
    });
  }

  //find all expenses categorises amount
  Map<ExpenseCategories, double> findExpensesCaAmount() {
    Map<ExpenseCategories, double> allAmountaInExpenses = {
      ExpenseCategories.food: 0,
      ExpenseCategories.health: 0,
      ExpenseCategories.shopping: 0,
      ExpenseCategories.subscriptions: 0,
      ExpenseCategories.transport: 0,
    };

    for (Expense expense in allExpenses) {
      allAmountaInExpenses[expense.category] =
          allAmountaInExpenses[expense.category]! + expense.amount;
    }

    return allAmountaInExpenses;
  }

  //find all incomes categeres amounts
  Map<IncomeCategories, double> findIncomesCaAmount() {
    Map<IncomeCategories, double> allAmountIncomes = {
      IncomeCategories.freelance: 0,
      IncomeCategories.passive: 0,
      IncomeCategories.salary: 0,
      IncomeCategories.sales: 0,
    };
    for (Income income in allIncomes) {
      allAmountIncomes[income.category] =
          allAmountIncomes[income.category]! + income.amount;
    }

    return allAmountIncomes;
  }

  //fetch expenses data
  @override
  void initState() {
    super.initState();
    setState(() {
      fetchAllExpenses();
      fetchAllIncomes();
    });
  }

  @override
  Widget build(BuildContext context) {
    //pages list
    final List<Widget> pages = [
      HomeScreen(
        allExpensesList: allExpenses,
        allIncomeList: allIncomes,
      ),
      TransactionScreen(
        removeIncome: deleteIncome,
        incomeList: allIncomes,
        deleteExpense: removeExpenses,
        expensesList: allExpenses,
      ),
      AddScreen(
        addIncome: addIncome,
        addExpense: addExpenses,
      ),
      BudgetScreen(
        expensesAmount: findExpensesCaAmount(),
        incomeAmount: findIncomesCaAmount(),
      ),
      const ProfileScreen(),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: cIndex,
        selectedIconTheme: const IconThemeData(size: 30),
        selectedItemColor: kMainColor,
        selectedFontSize: 18,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
        unselectedItemColor: kGrey,
        unselectedIconTheme: const IconThemeData(
          size: 25,
        ),
        onTap: (value) {
          setState(() {
            cIndex = value;
          });
        },
        items: [
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home"),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.route_rounded,
              ),
              label: "Transaction"),
          BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: kMainColor,
                ),
                child: const Center(
                  child: Icon(
                    Icons.add,
                    color: kWhite,
                  ),
                ),
              ),
              label: ""),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.pie_chart,
              ),
              label: "Budget"),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "Profile"),
        ],
        type: BottomNavigationBarType.fixed,
      ),
      body: pages[cIndex],
    );
  }
}
