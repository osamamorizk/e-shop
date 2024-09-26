import 'package:flutter/material.dart';
import 'package:shop_app/feature/home/data/models/product_model.dart';
import 'package:shop_app/feature/home/presentation/views/widgets/price_and_add_to_cart.dart';
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
