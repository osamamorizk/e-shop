import 'package:flutter/material.dart';
import 'package:shop_app/feature/cart/presentation/views/widgets/count_button.dart';

class CartCount extends StatefulWidget {
  const CartCount({super.key});

  @override
  State<CartCount> createState() => _CartCountState();
}

class _CartCountState extends State<CartCount> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          CountButton(
            onPressed: () {
              if (count > 0) {
                count--;
              }
              setState(() {});
            },
            icon: Icons.remove,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
            ),
            height: 35,
            width: 35,
            child: Center(
                child: Text(
              '$count',
              style: const TextStyle(fontSize: 20),
            )),
          ),
          CountButton(
            onPressed: () {
              setState(() {});
              count++;
            },
            icon: Icons.add,
          ),
        ],
      ),
    );
  }
}
