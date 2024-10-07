import 'package:expenz_app/screens/onbording%20screens/onbording_screens.dart';
import 'package:expenz_app/services/expense_servicers.dart';
import 'package:expenz_app/services/income_services.dart';
import 'package:expenz_app/services/user_services.dart';
import 'package:expenz_app/utils/colors.dart';
import 'package:expenz_app/widgets/profile_screen_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _userName = "";
  String _email = "";

  @override
  void initState() {
    UserServices.getUserDetails().then((value) {
      setState(() {
        if (value["userName"] != null && value["userEmail"] != null) {
          _userName = value["userName"]!;
          _email = value["userEmail"]!;
        }
      });
    });
    super.initState();
  }

  //bottom sheet function
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: kMainColor,
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Are you sure do you wanna logout?",
                style: TextStyle(
                  color: kWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      //delete user data
                      UserServices.deleteUserData(context);
                      //delete all expenses and incomes
                      ExpenseServicers().clearAllExpensesData(context);
                      IncomeServices().clearAllIncomesData(context);

                      //navigator
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OnbordingScreens(),
                          ));
                    },
                    child: const Text(
                      "yes",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "no",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  //other fields functions
  void _otherBottomSheet(BuildContext context, String name) {
    showModalBottomSheet(
      backgroundColor: kGrey,
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height * 0.7,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: kWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blue)),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "okay",
                  style: TextStyle(
                    color: kWhite,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 3,
                        color: kMainColor,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        "assets/images/user1.jpg",
                        width: 80,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          _email,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: kGrey,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          _userName,
                          style: const TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w600,
                            color: kBlack,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.verified_user_rounded,
                    size: 30,
                    color: kGreen,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10,
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      _otherBottomSheet(context,
                          "*First, go to the \"Add screen\" and add your Incomes and Expenses.\n\n*On the \"Home Screen\", it will display the total of all your Incomes and Expenses.\n*On the \"Transaction screen\", you can view all the Incomes and Expenses you've added, and you can also swipe to delete them.\n*On the \"Budgets screen\", you can view the proportion of your Incomes and Expenses through a pie chart.");
                    },
                    child: const ProfileScreenWidget(
                      text: "How to use",
                      iconType: Icons.verified_user_sharp,
                      backColor: Color(0xffEEE5FF),
                    ),
                  ),
                  const Divider(),
                  GestureDetector(
                    onTap: () {
                      _otherBottomSheet(context,
                          "*Here, you have the ability to add your Incomes and Expenses.\n\n*Additionally, by clicking the log out button available on the \"profile screen\", you can log out of the app. \n\n*When doing so, all the data stored in the app will be deleted.");
                    },
                    child: const ProfileScreenWidget(
                      text: "features",
                      iconType: Icons.settings,
                      backColor: Color(0xffEEE5FF),
                    ),
                  ),
                  const Divider(),
                  GestureDetector(
                    onTap: () {
                      _otherBottomSheet(context, "This feature is disabled!");
                    },
                    child: const ProfileScreenWidget(
                      text: "Export Data",
                      iconType: Icons.download,
                      backColor: Color(0xffEEE5FF),
                    ),
                  ),
                  const Divider(),
                  GestureDetector(
                    onTap: () {
                      _showBottomSheet(context);
                    },
                    child: const ProfileScreenWidget(
                      text: "Logout",
                      iconType: Icons.logout,
                      backColor: Color(0xffFFE2E4),
                    ),
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
