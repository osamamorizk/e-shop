import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/feature/home/presentation/manger/category_cubit/category_cubit.dart';
import 'package:shop_app/feature/home/presentation/manger/category_product/category_product_cubit_cubit.dart';
import 'package:shop_app/feature/home/presentation/views/widgets/category_item.dart';
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

class SkeletonizerCategory extends StatelessWidget {
  const SkeletonizerCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: SizedBox(
        height: 40,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Center(
                      child: Text(
                    'Category    Name',
                    maxLines: 2,
                  ))),
            ),
          ),
        ),
      ),
    );
  }
}
