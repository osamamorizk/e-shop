import 'package:flutter/material.dart';
import 'package:shop_app/feature/home/presentation/views/widgets/products_details_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: ProductDetailsBody());
  }
}
