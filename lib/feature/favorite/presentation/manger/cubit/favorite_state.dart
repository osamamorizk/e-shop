part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class AddToFavoriteLoading extends FavoriteState {}

final class AddToFavoriteSuccess extends FavoriteState {}

final class AddToFavoriteFailure extends FavoriteState {
  final String errorMessage;

  AddToFavoriteFailure({required this.errorMessage});
}

final class GetFavoriteLoading extends FavoriteState {}

final class GetFavoriteSuccess extends FavoriteState {
  final List<ProductModel> favoProducts;

  GetFavoriteSuccess({required this.favoProducts});
}

final class GetFavoriteFailure extends FavoriteState {
  final String errorMessage;

  GetFavoriteFailure({required this.errorMessage});
}
