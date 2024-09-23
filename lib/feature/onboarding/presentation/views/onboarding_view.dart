import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/core/Routing/routes.dart';
import 'package:shop_app/core/helpers/cashe_hlper.dart';
import 'package:shop_app/feature/onboarding/onboard_consts.dart';
import 'package:shop_app/feature/onboarding/presentation/views/widgets/custom_onboarding_button.dart';
import 'package:shop_app/feature/onboarding/presentation/views/widgets/custom_indicator.dart';
import 'package:shop_app/feature/onboarding/presentation/views/widgets/onboarding_item.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  PageController pageController = PageController();

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/quickmart.png'),
        actions: [
          TextButton(
              onPressed: () async {
                GoRouter.of(context).go(Routes.loginView);
                await CasheHlper.saveData(key: 'onboarding', value: true);
              },
              child: const Text(
                'Skip',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff6F7384),
                ),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (newIndex) {
                  if (newIndex == onboardList.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemCount: 3,
                itemBuilder: (context, index) {
                  return CustomOnboardingItem(
                    onboardingModel: onboardList[index],
                  );
                },
              ),
            ),
            CustomOnboardButton(
              onTap: () async {
                if (isLast) {
                  await CasheHlper.saveData(key: 'onboarding', value: true);
                  GoRouter.of(context).go(Routes.loginView);
                } else {
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeOutCubic);
                }
              },
              text: isLast ? 'Get Started' : 'Next',
            ),
            const SizedBox(height: 30),
            CustomIndicator(pageController: pageController),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
