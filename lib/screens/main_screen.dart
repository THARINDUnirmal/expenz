import 'package:expenz_app/utils/colors.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //pages list

  final List<Widget> pages = [];

  //curunt index
  int cIndex = 0;
  @override
  Widget build(BuildContext context) {
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
        items: [
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home"),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.transcribe,
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
      //body: pages[cIndex],
    );
  }
}
