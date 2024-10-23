import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/feature/cart/data/repos/cart_repo.dart';
import 'package:shop_app/feature/home/data/models/product_model.dart';

part 'local_cart_state.dart';

class LocalCartCubit extends Cubit<LocalCartState> {
  LocalCartCubit(this.cartRepo) : super(LocalCartInitial());
  List<ProductModel> productsList = [];

  int productCount = 1;
  int cartCount = 1;
  final CartRepo cartRepo;
  Future<void> addProductCart(BuildContext context,
      {required ProductModel productModel}) async {
    emit(LocalCartLoading());
    var result = await cartRepo.addToCart(
        category: productModel.category,
        count: productCount,
        description: productModel.description,
        id: productModel.id,
        image: productModel.image,
        price: productModel.price,
        rate: productModel.rate,
        title: productModel.title,
        context);
    result.fold(
      (failure) {
        emit(
          LocalCartFailure(errorMessage: failure.errorMessage),
        );
      },
      (addDone) {
        emit(
          LocalCartSuccess(),
        );
      },
    );
  }

  Future<void> getCartProducts() async {
    emit(GetLocalCartLoading());
    var result = await cartRepo.getCart();

    result.fold(
      (failure) {
        emit(
          GetLocalCartFailure(errorMessage: failure.errorMessage),
        );
      },
      (product) {
        productsList = product;
        emit(GetLocalCartSuccess(products: product));
      },
    );
  }

  Future<void> deleteCart({required ProductModel productModel}) async {
    var result = await cartRepo.deletCartProduct(productModel: productModel);
    result.fold((failure) {
      emit(LocalCartFailure(errorMessage: failure.errorMessage));
    }, (success) async {
      await getCartProducts();
      emit(LocalCartSuccess());
    });
  }

  Future<void> updateCartCount(
      {required BuildContext context,
      required ProductModel productModel,
      required bool increment}) async {
    var result = await cartRepo.updateProductCount(
        context: context, productModel: productModel, increment: increment);
    result.fold((failure) {}, (success) {});
  }
}
