import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:shop_app/feature/cart/data/models/cart_product_model.dart';
import 'package:shop_app/feature/cart/data/repos/cart_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitial());
  List<CartProductModel> productsList = [];
  final CartRepo cartRepo;
  Future<void> addProductCart({
    required String title,
    required String description,
    required num rate,
    required String image,
    required num price,
    required int id,
    required String category,
  }) async {
    emit(CartAddLoading());
    var result = await cartRepo.addToCart(
        title: title,
        description: description,
        rate: rate,
        image: image,
        price: price,
        id: id,
        category: category);
    result.fold(
      (failure) {
        emit(
          CartAddFailure(errorMessage: failure.errorMessage),
        );
      },
      (addDone) {
        emit(
          CartAddSuccess(),
        );
      },
    );
  }

  Future<void> getCartProducts() async {
    var result = await cartRepo.getCart();

    result.fold(
      (failure) {
        emit(
          GetCartFailure(errorMessage: failure.errorMessage),
        );
      },
      (product) {
        productsList = product;
        emit(GetCartSuccess(products: product));
      },
    );
  }
}
