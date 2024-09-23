import 'package:flutter/material.dart';
import 'package:shop_app/feature/onboarding/data/models/on_boarding_model.dart';
import 'package:shop_app/feature/onboarding/presentation/widgets/custom_stack.dart';

class CustomOnboardingItem extends StatelessWidget {
  const CustomOnboardingItem({
    super.key,
    required this.onboardingModel,
  });

  final OnboardingModel onboardingModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomStack(
          image: onboardingModel.image,
        ),
        const SizedBox(height: 15),
        Text(
          textAlign: TextAlign.center,
          onboardingModel.text,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 15),
        Text(
          textAlign: TextAlign.center,
          onboardingModel.desc,
          style: const TextStyle(fontSize: 20, color: Color(0xff6F7384)),
        ),
      ],
    );
  }
}
