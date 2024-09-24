import 'package:flutter/material.dart';
import 'package:shop_app/feature/home/presentation/views/widgets/custom_slider.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [CustomCarouselSlider()],
    );
  }
}
