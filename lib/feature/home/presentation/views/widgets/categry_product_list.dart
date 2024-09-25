import 'package:flutter/material.dart';
import 'package:shop_app/feature/home/presentation/views/widgets/product_cat_item.dart';

class CategryProductList extends StatelessWidget {
  const CategryProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 245,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: 10),
          child: GestureDetector(child: const ProductCatItem()),
        ),
      ),
    );
  }
}
