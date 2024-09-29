import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/core/Routing/routes.dart';
import 'package:shop_app/core/widgets/favorite_icon.dart';
import 'package:shop_app/feature/home/data/models/product_model.dart';
import 'package:shop_app/feature/home/presentation/views/widgets/category_product_name_price.dart';

class ProductCatItem extends StatelessWidget {
  const ProductCatItem({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(Routes.productDetailsView, extra: productModel);
      },
      child: Stack(
        children: [
          Container(
            width: 170,
            decoration: BoxDecoration(
              border: Border.all(width: .1),
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CategryProductNamePrice(
                productModel: productModel,
              ),
            ),
          ),
          Positioned(
              right: 10,
              bottom: 2,
              child: FavoriteIcon(
                productModel: productModel,
              ))
        ],
      ),
    );
  }
}
