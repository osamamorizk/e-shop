import 'package:flutter/material.dart';
import 'package:shop_app/core/widgets/custom_button.dart';
import 'package:shop_app/feature/home/data/models/product_model.dart';

class PriceANdAddCart extends StatelessWidget {
  const PriceANdAddCart({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Price',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const Spacer(),
              Text(
                r'$' '${productModel.price}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 175,
            height: 58,
            child: CustomButton(text: 'Add to cart'),
          )
        ],
      ),
    );
  }
}
