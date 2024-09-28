import 'package:flutter/material.dart';
import 'package:shop_app/feature/cart/data/models/cart_product_model.dart';
import 'package:shop_app/feature/cart/presentation/views/widgets/cart_count.dart';

class PriceAndCount extends StatefulWidget {
  const PriceAndCount({
    super.key,
    required this.cartProductModel,
  });

  final CartProductModel cartProductModel;

  @override
  State<PriceAndCount> createState() => _PriceAndCountState();
}

class _PriceAndCountState extends State<PriceAndCount> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          r'$'
          '${widget.cartProductModel.price}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        CartCount(
          cartProductModel: widget.cartProductModel,
          count: widget.cartProductModel.count,
        )
      ],
    );
  }
}
