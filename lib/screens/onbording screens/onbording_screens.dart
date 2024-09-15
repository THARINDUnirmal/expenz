import 'package:expenz_app/screens/onbording%20screens/widgets/onbording_widget.dart';
import 'package:flutter/material.dart';

class OnbordingScreens extends StatefulWidget {
  const OnbordingScreens({super.key});

  @override
  State<OnbordingScreens> createState() => _OnbordingScreensState();
}

class _OnbordingScreensState extends State<OnbordingScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          OnbordingWidget(),
        ],
      ),
    );
  }
}
