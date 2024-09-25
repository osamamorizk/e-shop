import 'package:flutter/material.dart';
import 'package:shop_app/feature/home/presentation/views/widgets/category_item.dart';
import 'package:shop_app/feature/home/presentation/views/widgets/categry_product_list.dart';
import 'package:shop_app/feature/home/presentation/views/widgets/custom_slider.dart';
import 'package:shop_app/feature/home/presentation/views/widgets/latest_product_list.dart';
import 'package:shop_app/feature/home/presentation/views/widgets/latest_products_title.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 15),
          const CustomCarouselSlider(),
          const SizedBox(height: 20),
          SizedBox(
            height: 45,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 10),
                child: GestureDetector(
                    onTap: () {
                      currentIndex = index;
                      setState(() {});
                    },
                    child: CategoryItem(
                      isSelected: currentIndex == index,
                    )),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const CategryProductList(),
          const SizedBox(height: 15),
          const LatestProductsTitle(),
          const SizedBox(height: 8),
          const LatestProductList(),
        ],
      ),
    );
  }
}
