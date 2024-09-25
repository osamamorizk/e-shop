part of 'category_product_cubit_cubit.dart';

@immutable
sealed class CategoryProductState {}

final class CategoryCubitInitial extends CategoryProductState {}

final class LoadingCatProduct extends CategoryProductState {}

final class FailureCatProduct extends CategoryProductState {
  final String errorMessage;

  FailureCatProduct({required this.errorMessage});
}

final class SucessCatProduct extends CategoryProductState {
  final List<ProductModel> catProducts;

  SucessCatProduct({required this.catProducts});
}
