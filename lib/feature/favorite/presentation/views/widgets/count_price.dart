import 'package:flutter/material.dart';
import 'package:shop_app/core/widgets/product_count.dart';
import 'package:shop_app/feature/home/data/models/product_model.dart';

class CountAndPrice extends StatelessWidget {
  const CountAndPrice({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            productModel.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 180,
            child: Row(
              children: [
                Text(
                  r'$' '${productModel.price}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                const ProductCount()
              ],
            ),
          )
        ],
      ),
    );
  }
}
