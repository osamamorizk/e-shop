import 'package:flutter/material.dart';
import 'package:shop_app/feature/home/data/models/product_model.dart';

class CategryProductNamePrice extends StatelessWidget {
  const CategryProductNamePrice({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        SizedBox(
          width: 150,
          height: 155,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            child: Image.network(fit: BoxFit.fill, productModel.image),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productModel.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 5),
              Text(
                r'$ ' '${productModel.price}',
                style: const TextStyle(
                  fontSize: 16,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
