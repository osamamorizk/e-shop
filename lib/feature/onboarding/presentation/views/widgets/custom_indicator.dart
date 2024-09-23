import 'package:flutter/material.dart';
import 'package:shop_app/feature/onboarding/onboard_consts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
        effect: const JumpingDotEffect(
          dotWidth: 20,
          dotHeight: 10,
          activeDotColor: Colors.black,
        ),
        controller: pageController,
        count: onboardList.length);
  }
}
