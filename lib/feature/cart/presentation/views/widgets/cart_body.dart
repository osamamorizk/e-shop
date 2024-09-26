import 'package:flutter/material.dart';
import 'package:shop_app/feature/cart/presentation/views/widgets/cart_product_item.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return const CartProductItem();
        });
  }
}
