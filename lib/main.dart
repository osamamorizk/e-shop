import 'package:flutter/material.dart';
import 'package:shop_app/feature/onboarding/presentation/views/onboarding_view.dart';

void main() {
  runApp(const MarketAPP());
}

class MarketAPP extends StatelessWidget {
  const MarketAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: OnboardingView(),
      ),
    );
  }
}
