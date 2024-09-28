part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartAddLoading extends CartState {}

final class CartAddFailure extends CartState {
  final String errorMessage;

  CartAddFailure({required this.errorMessage});
}

final class CartAddSuccess extends CartState {}

////
final class GetCartLoading extends CartState {}

final class GetCartFailure extends CartState {
  final String errorMessage;

  GetCartFailure({required this.errorMessage});
}

final class GetCartSuccess extends CartState {
  final List<CartProductModel> products;
  GetCartSuccess({required this.products});
}

///
///final class CartAddSuccess extends CartState {}

////
final class GetIdLoading extends CartState {}

final class GetIdFailure extends CartState {
  final String errorMessage;

  GetIdFailure({required this.errorMessage});
}

final class GetIdSuccess extends CartState {
  final List<String> products;
  GetIdSuccess({required this.products});
}
