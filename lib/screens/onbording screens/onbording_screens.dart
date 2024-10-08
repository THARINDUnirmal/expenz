import 'package:expenz_app/screens/details.dart';
import 'package:expenz_app/screens/onbording%20screens/widgets/logo_page.dart';
import 'package:expenz_app/screens/onbording%20screens/widgets/onbording_widget.dart';
import 'package:expenz_app/utils/colors.dart';
import 'package:expenz_app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnbordingScreens extends StatefulWidget {
  const OnbordingScreens({super.key});

  @override
  State<OnbordingScreens> createState() => _OnbordingScreensState();
}

class _OnbordingScreensState extends State<OnbordingScreens> {
  bool showDetailsPaage = false;
  PageController contraller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            PageView(
              onPageChanged: (index) {
                setState(
                  () {
                    showDetailsPaage = index == 3;
                  },
                );
              },
              controller: contraller,
              children: const [
                LogoPage(),
                OnbordingWidget(
                  cardImageUrl: "assets/images/onbording1.png",
                  cardTitile: "Gain total control \nof your money",
                  cardDescription:
                      "Become your own money manager \nand make every cent count",
                ),
                OnbordingWidget(
                  cardImageUrl: "assets/images/onbording2.png",
                  cardTitile: "Know where your money goes",
                  cardDescription:
                      "Track your transaction easily,\nwith categories and financial report ",
                ),
                OnbordingWidget(
                  cardImageUrl: "assets/images/onbording3.png",
                  cardTitile: "Planning ahead",
                  cardDescription:
                      "Setup your budget for each category \nso you in control",
                ),
              ],
            ),
            Container(
              alignment: const Alignment(0, 0.75),
              child: SmoothPageIndicator(
                effect: const WormEffect(
                  activeDotColor: Colors.blueAccent,
                  dotColor: kGrey,
                ),
                controller: contraller,
                count: 4,
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: showDetailsPaage
                  ? GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Details(),
                          ),
                        );
                      },
                      child: Button(
                        buttonTitle: showDetailsPaage ? "Get Start" : "Next",
                        buttonColor: kMainColor,
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        contraller.animateToPage(
                          contraller.page!.toInt() + 1,
                          duration: const Duration(
                            milliseconds: 400,
                          ),
                          curve: Curves.linear,
                        );
                      },
                      child: Button(
                        buttonTitle: showDetailsPaage ? "Get Start" : "Next",
                        buttonColor: kMainColor,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
