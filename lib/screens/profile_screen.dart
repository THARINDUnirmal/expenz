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
        if (value["userName"] != null) {
          _userName = value["userName"]!;
        }
        if (value["userEmail"] != null) {
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
          height: MediaQuery.of(context).size.height * 0.4,
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
                    onPressed: () {},
                    child: const Text("yes"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("no"),
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
          height: MediaQuery.of(context).size.height * 0.4,
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
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("okay"),
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
                        "assets/images/user.jpg",
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
                        width: 210,
                        child: Text(
                          _email,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: kGrey,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: 210,
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
                      _otherBottomSheet(context, "Goto log out featuer");
                    },
                    child: const ProfileScreenWidget(
                      text: "My Wallet",
                      iconType: Icons.wallet,
                      backColor: Color(0xffEEE5FF),
                    ),
                  ),
                  const Divider(),
                  const ProfileScreenWidget(
                    text: "Settings",
                    iconType: Icons.settings,
                    backColor: Color(0xffEEE5FF),
                  ),
                  const Divider(),
                  const ProfileScreenWidget(
                    text: "Export Data",
                    iconType: Icons.download,
                    backColor: Color(0xffEEE5FF),
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
