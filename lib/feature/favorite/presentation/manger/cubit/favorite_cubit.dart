import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/feature/favorite/data/repos/favorite_repo.dart';
import 'package:shop_app/feature/home/data/models/product_model.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.favoriteRepo) : super(FavoriteInitial());
  final FavoriteRepo favoriteRepo;
  List<ProductModel> favoProducts = [];
  bool isFavorite({required ProductModel productModel}) {
    for (var element in favoProducts) {
      if (element.id == productModel.id) {
        return true;
      }
    }
    return false;
  }

  Future<void> addToFav({ProductModel? productModel}) async {
    emit(AddToFavoriteLoading());
    var result = await favoriteRepo.addToFavorite(productModel: productModel!);
    result.fold(
      (failure) {
        emit(AddToFavoriteFailure(errorMessage: failure.errorMessage));
      },
      (favorit) {
        emit(AddToFavoriteSuccess());
      },
    );
  }

  Future<void> getFavoProducts() async {
    emit(GetFavoriteLoading());
    var result = await favoriteRepo.getFavorite();

    result.fold(
      (failure) {
        emit(
          GetFavoriteFailure(errorMessage: failure.errorMessage),
        );
      },
      (favo) {
        favoProducts = favo;
        emit(GetFavoriteSuccess(favoProducts: favo));
      },
    );
  }

  Future<void> deleteCartProduct({
    required int productId,
  }) async {
    var result = await favoriteRepo.deletFavoriteProduct(
      productId: productId,
    );
    result.fold(
      (failure) {
        emit(DeleteFavoriteFailure(errorMessage: failure.errorMessage));
      },
      (delete) {
        emit(DeleteFavoriteSuccess());
      },
    );
  }
}
