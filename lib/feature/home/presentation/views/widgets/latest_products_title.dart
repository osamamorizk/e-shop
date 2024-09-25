import 'package:flutter/material.dart';

class LatestProductsTitle extends StatelessWidget {
  const LatestProductsTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            textAlign: TextAlign.start,
            'Latest Products',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          Spacer(),
          Text(
            textAlign: TextAlign.start,
            'See all',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
