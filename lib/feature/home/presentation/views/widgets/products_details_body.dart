import 'package:flutter/material.dart';
import 'package:shop_app/core/widgets/custom_button.dart';
import 'package:shop_app/feature/home/data/models/product_model.dart';
import 'package:shop_app/feature/home/presentation/views/widgets/product_image_stack.dart';
import 'package:shop_app/feature/home/presentation/views/widgets/product_rate.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Center(child: ImageStack(image: productModel.image)),
            const SizedBox(height: 10),
            Text(
              productModel.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            ProductRate(
              productModel: productModel,
            ),
            Text(
              productModel.description,
              style: const TextStyle(
                color: Colors.blueGrey,
                fontSize: 18,
              ),
            ),
            const Divider(),
            const SizedBox(height: 15),
            PriceANdAddCart(
              productModel: productModel,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

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
