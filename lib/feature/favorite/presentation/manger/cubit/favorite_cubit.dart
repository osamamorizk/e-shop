import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/feature/favorite/data/repos/favorite_repo.dart';
import 'package:shop_app/feature/home/data/models/product_model.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.favoriteRepo) : super(FavoriteInitial());
  final FavoriteRepo favoriteRepo;
  List<ProductModel> favoProducts = [];

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

  Future<void> getCartProducts() async {
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
}
