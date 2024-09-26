import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/feature/home/presentation/manger/category_cubit/category_cubit.dart';
import 'package:shop_app/feature/home/presentation/manger/category_product/category_product_cubit_cubit.dart';
import 'package:shop_app/feature/home/presentation/views/widgets/category_item.dart';
import 'package:shop_app/feature/home/presentation/views/widgets/skeletonizer_category.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is SuccessCategory) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 45,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.categories.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                      onTap: () async {
                        setState(() {
                          currentIndex = index;
                        });
                        await BlocProvider.of<CategoryProductCubit>(context)
                            .featchCatProducts(
                                categryName:
                                    state.categories[index].categoryName);
                      },
                      child: CategoryItem(
                        categoryModel: state.categories[index],
                        isSelected: currentIndex == index,
                      )),
                ),
              ),
            ),
          );
        } else if (state is FailureCategory) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return const SkeletonizerCategory();
        }
      },
    );
  }
}
