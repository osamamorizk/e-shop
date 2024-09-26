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
