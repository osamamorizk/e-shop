import 'package:flutter/material.dart';
import 'package:shop_app/feature/home/data/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key, required this.isSelected, required this.categoryModel});
  final bool isSelected;
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 155,
      decoration: BoxDecoration(
        border: Border.all(width: .2),
        borderRadius: BorderRadius.circular(16),
        color: isSelected ? Colors.black : Colors.white,
      ),
      child: Center(
        child: Text(
          categoryModel.categoryName,
          style: TextStyle(
              fontSize: 18, color: isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
