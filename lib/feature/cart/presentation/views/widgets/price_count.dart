import 'package:flutter/material.dart';
import 'package:shop_app/feature/cart/presentation/views/widgets/cart_count.dart';

class PriceAndCount extends StatelessWidget {
  const PriceAndCount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          r'$' '400',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        CartCount()
      ],
    );
  }
}
