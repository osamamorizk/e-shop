import 'package:flutter/material.dart';
import 'package:shop_app/feature/cart/presentation/views/widgets/count_button.dart';

class CartCount extends StatelessWidget {
  const CartCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          const CountButton(
            icon: Icons.remove,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
            ),
            height: 35,
            width: 35,
            child: const Center(
                child: Text(
              '5',
              style: TextStyle(fontSize: 20),
            )),
          ),
          const CountButton(
            icon: Icons.add,
          ),
        ],
      ),
    );
  }
}
