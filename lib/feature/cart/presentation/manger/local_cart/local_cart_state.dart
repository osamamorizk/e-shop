part of 'local_cart_cubit.dart';

@immutable
sealed class LocalCartState {}

final class LocalCartInitial extends LocalCartState {}

final class LocalCartLoading extends LocalCartState {}

final class LocalCartFailure extends LocalCartState {
  final String errorMessage;

  LocalCartFailure({required this.errorMessage});
}

final class LocalCartSuccess extends LocalCartState {}

//
final class GetLocalCartLoading extends LocalCartState {}

final class GetLocalCartFailure extends LocalCartState {
  final String errorMessage;

  GetLocalCartFailure({required this.errorMessage});
}

final class GetLocalCartSuccess extends LocalCartState {
  final List<ProductModel> products;
  GetLocalCartSuccess({required this.products});
}
