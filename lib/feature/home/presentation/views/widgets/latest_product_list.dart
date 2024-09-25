import 'package:flutter/material.dart';
import 'package:shop_app/feature/home/presentation/views/widgets/latest_product_item.dart';

class LatestProductList extends StatelessWidget {
  const LatestProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: 4,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(left: 0),
        child: GestureDetector(
          onTap: () {},
          child: const LatestProductItem(),
        ),
      ),
    );
  }
}
