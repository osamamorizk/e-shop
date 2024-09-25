import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(fit: BoxFit.fill, 'assets/images/banner1.jpg')),
        ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(fit: BoxFit.fill, 'assets/images/banner3.jpg')),
        ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(fit: BoxFit.fill, 'assets/images/banner4.jpg')),
      ],
      options: CarouselOptions(
        height: 150,
        viewportFraction: .8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 1000),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
