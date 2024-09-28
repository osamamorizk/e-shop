import 'package:flutter/material.dart';
import 'package:shop_app/feature/cart/data/models/cart_product_model.dart';
import 'package:shop_app/feature/cart/presentation/views/widgets/price_count.dart';
import 'package:shop_app/feature/cart/presentation/views/widgets/title_delet.dart';

class CartProductItem extends StatelessWidget {
  const CartProductItem({
    super.key,
    required this.cartProductModel,
  });
  final CartProductModel cartProductModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Container(
        height: 130,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 110,
              width: 75,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(cartProductModel.image)),
            ),
            SizedBox(
              width: 240,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TitleAndDelet(
                    title: cartProductModel.title,
                  ),
                  PriceAndCount(
                    cartProductModel: cartProductModel,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
