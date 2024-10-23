import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/errors/failure.dart';
import 'package:shop_app/feature/home/data/models/product_model.dart';

abstract class CartRepo {
  Future<Either<Failure, void>> addToCart(
    BuildContext context, {
    required String title,
    required String description,
    required num rate,
    required String image,
    required num price,
    required int id,
    required String category,
    required int count,
  });
  Future<Either<Failure, List<ProductModel>>> getCart();
  // Future<Either<Failure, void>> deletCartProduct({required int productId});
  Future<Either<Failure, void>> deletCartProduct(
      {required ProductModel productModel});
  // Future<void> updateProduct({
  //   required int count,
  //   required int productId,
  // });
  Future<Either<Failure, void>> updateProductCount({
    required BuildContext context,
    required ProductModel productModel,
    required bool increment,
  });
}
