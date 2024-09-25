part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class LoadingCategory extends CategoryState {}

final class SuccessCategory extends CategoryState {
  final List<CategoryModel> categories;

  SuccessCategory({required this.categories});
}

final class FailureCategory extends CategoryState {
  final String errorMessage;

  FailureCategory({required this.errorMessage});
}
