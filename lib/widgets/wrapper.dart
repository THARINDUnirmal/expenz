import 'package:expenz_app/screens/main_screen.dart';
import 'package:expenz_app/screens/onbording%20screens/onbording_screens.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  final bool displayUi;
  const Wrapper({
    super.key,
    required this.displayUi,
  });

  @override
  Widget build(BuildContext context) {
    return displayUi ? const MainScreen() : const OnbordingScreens();
  }
}
