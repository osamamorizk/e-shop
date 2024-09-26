import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/feature/cart/data/repos/cart_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitial());

  final CartRepo cartRepo;
  Future<void> addProductCart({
    required String title,
    required String description,
    required num rate,
    required String image,
    required num price,
    required int id,
  }) async {
    emit(CartAddLoading());
    var result = await cartRepo.addToCart(
        title: title,
        description: description,
        rate: rate,
        image: image,
        price: price,
        id: id);
    result.fold(
      (failure) {
        emit(
          CartAddFailure(errorMessage: failure.errorMessage),
        );
      },
      (addDone) {
        log('done');
        emit(
          CartAddSuccess(),
        );
      },
    );
  }
}
