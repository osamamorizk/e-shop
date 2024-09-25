part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class LoadingCategory extends HomeState {}

final class SuccessCategory extends HomeState {
  final List<CategoryModel> categories;

  SuccessCategory({required this.categories});
}

final class FailureCategory extends HomeState {
  final String errorMessage;

  FailureCategory({required this.errorMessage});
}

////////////////
final class LoadingCatProduct extends HomeState {}

final class SucessCatProduct extends HomeState {
  final List<ProductModel> catProducts;

  SucessCatProduct({required this.catProducts});
}

final class FailureCatProduct extends HomeState {
  final String errorMessage;

  FailureCatProduct({required this.errorMessage});
}

///////////////
///
final class LoadingAllProducts extends HomeState {}

final class SucessAllProducts extends HomeState {
  final List<ProductModel> allProducts;

  SucessAllProducts({required this.allProducts});
}

final class FailureAllProducts extends HomeState {
  final String errorMessage;

  FailureAllProducts({required this.errorMessage});
}
