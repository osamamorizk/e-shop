import 'package:flutter/material.dart';
import 'package:shop_app/feature/home/presentation/views/widgets/category_list.dart';

import 'package:shop_app/feature/home/presentation/views/widgets/categry_product_list.dart';
import 'package:shop_app/feature/home/presentation/views/widgets/custom_slider.dart';
import 'package:shop_app/feature/home/presentation/views/widgets/latest_product_list.dart';
import 'package:shop_app/feature/home/presentation/views/widgets/latest_products_title.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 15),
          CustomCarouselSlider(),
          SizedBox(height: 20),
          CategoryList(),
          SizedBox(height: 20),
          CategryProductList(),
          SizedBox(height: 15),
          LatestProductsTitle(),
          SizedBox(height: 8),
          LatestProductList(),
        ],
      ),
    );
  }
}
