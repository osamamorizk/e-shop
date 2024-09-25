class CategoryModel {
  final String categoryName;

  CategoryModel({required this.categoryName});

  factory CategoryModel.fromJson(json) {
    return CategoryModel(categoryName: json);
  }
}
