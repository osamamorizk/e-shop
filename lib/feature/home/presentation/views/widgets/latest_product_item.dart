import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/core/Routing/routes.dart';
import 'package:shop_app/core/widgets/favorite_icon.dart';
import 'package:shop_app/feature/home/data/models/product_model.dart';

class LatestProductItem extends StatelessWidget {
  const LatestProductItem({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(Routes.productDetailsView, extra: productModel);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: Container(
          height: 120,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 110,
                width: 100,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(productModel.image)),
              ),
              SizedBox(
                width: 180,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      productModel.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      r'$' '${productModel.price}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
              FavoriteIcon(
                productModel: productModel,
              )
            ],
          ),
        ),
      ),
    );
  }
}
