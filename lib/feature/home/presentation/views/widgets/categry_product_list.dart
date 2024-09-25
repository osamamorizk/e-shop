import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/feature/home/presentation/manger/category_product/category_product_cubit_cubit.dart';
import 'package:shop_app/feature/home/presentation/views/widgets/product_cat_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategryProductList extends StatelessWidget {
  const CategryProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryProductCubit, CategoryProductState>(
      builder: (context, state) {
        if (state is SucessCatProduct) {
          return Skeletonizer(
            enabled: state is LoadingCatProduct,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SizedBox(
                height: 255,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.catProducts.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: GestureDetector(
                        child: ProductCatItem(
                      productModel: state.catProducts[index],
                    )),
                  ),
                ),
              ),
            ),
          );
        } else if (state is FailureCatProduct) {
          return SizedBox(
            height: 250,
            child: Center(
              child: Text(state.errorMessage),
            ),
          );
        } else {
          return const SizedBox(
            height: 250,
            child: SkeletonizerCategoryProduct(),
          );
        }
      },
    );
  }
}

class SkeletonizerCategoryProduct extends StatelessWidget {
  const SkeletonizerCategoryProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              width: 170,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.grey[100]),
                    height: 150,
                    width: 165,
                  ),
                  const Text(
                    '33333333333334444444444444444444444333330',
                    maxLines: 4,
                  ),
                  const Text("test of skelton"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
