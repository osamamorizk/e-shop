part of 'all_product_cubit.dart';

@immutable
sealed class AllProductState {}

final class AllProductInitial extends AllProductState {}

final class LoadingAllProducts extends AllProductState {}

final class SucessAllProducts extends AllProductState {
  final List<ProductModel> allProducts;

  SucessAllProducts({required this.allProducts});
}

final class FailureAllProducts extends AllProductState {
  final String errorMessage;

  FailureAllProducts({required this.errorMessage});
}
