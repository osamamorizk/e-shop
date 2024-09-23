import 'package:flutter/material.dart';

class CustomStack extends StatelessWidget {
  const CustomStack({
    super.key,
    required this.image,
  });

  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 350,
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: Colors.grey.withOpacity(.05),
          ),
        ),
        Positioned(
          bottom: 30,
          right: 25,
          child: Image(height: 300, image: AssetImage(image)),
        ),
      ],
    );
  }
}
