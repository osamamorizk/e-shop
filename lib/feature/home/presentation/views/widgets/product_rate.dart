import 'package:flutter/material.dart';
import 'package:shop_app/feature/home/data/models/product_model.dart';

class ProductRate extends StatelessWidget {
  const ProductRate({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Row(
        children: [
          const Icon(
            size: 30,
            Icons.star,
            color: Colors.yellow,
          ),
          const Spacer(),
          Text(
            '${productModel.rate}/5',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
