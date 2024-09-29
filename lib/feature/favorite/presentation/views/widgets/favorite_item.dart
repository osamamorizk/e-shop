import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/core/Routing/routes.dart';
import 'package:shop_app/core/widgets/favorite_item.dart';
import 'package:shop_app/feature/home/data/models/product_model.dart';
import 'package:shop_app/core/widgets/product_count.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(Routes.productDetailsView, extra: productModel);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                width: 80,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(productModel.image)),
              ),
              CountAndPrice(productModel: productModel),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FavoriteIcon(
                    productModel: productModel,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_shopping_cart,
                      size: 35,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
                Spacer(),
                ProductCount()
              ],
            ),
          )
        ],
      ),
    );
  }
}
