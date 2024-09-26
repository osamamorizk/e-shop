import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_app/feature/home/presentation/manger/all_products/all_product_cubit.dart';
import 'package:shop_app/feature/home/presentation/views/widgets/latest_product_item.dart';
import 'package:shop_app/feature/home/presentation/views/widgets/skeletonizer_latest_product.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LatestProductList extends StatelessWidget {
  const LatestProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllProductCubit, AllProductState>(
      builder: (context, state) {
        if (state is SucessAllProducts) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: state.allProducts.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(left: 0),
              child: GestureDetector(
                onTap: () {},
                child: LatestProductItem(
                  productModel: state.allProducts[index],
                ),
              ),
            ),
          );
        } else if (state is FailureAllProducts) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return const SizedBox(child: SkeletonizerLatestProduct());
        }
      },
    );
  }
}
