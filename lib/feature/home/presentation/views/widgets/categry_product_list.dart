import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/feature/home/presentation/manger/category_product/category_product_cubit_cubit.dart';
import 'package:shop_app/feature/home/presentation/views/widgets/product_cat_item.dart';

class CategryProductList extends StatelessWidget {
  const CategryProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryProductCubit, CategoryProductState>(
      builder: (context, state) {
        if (state is SucessCatProduct) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SizedBox(
              height: 250,
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
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ),
          );
        }
      },
    );
  }
}
