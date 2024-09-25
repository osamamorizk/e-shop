import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.isSelected});
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 125,
      decoration: BoxDecoration(
        border: Border.all(width: .2),
        borderRadius: BorderRadius.circular(16),
        color: isSelected ? Colors.black : Colors.white,
      ),
      child: Center(
        child: Text(
          'Electronics',
          style: TextStyle(
              fontSize: 18, color: isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
