import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/core/Routing/routes.dart';
import 'package:shop_app/core/helpers/consts.dart';
import 'package:shop_app/feature/home/data/models/product_model.dart';

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
              child: CategryProductDetails(
                productModel: productModel,
              ),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 2,
            child: CircleAvatar(
                backgroundColor: kPrimaryColor.withOpacity(.07),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(FontAwesomeIcons.heart))),
          )
        ],
      ),
    );
  }
}

class CategryProductDetails extends StatelessWidget {
  const CategryProductDetails({
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
