import 'package:dartz/dartz.dart';
import 'package:shop_app/core/errors/failure.dart';
import 'package:shop_app/feature/cart/data/models/cart_product_model.dart';

abstract class CartRepo {
  Future<Either<Failure, void>> addToCart({
    required String title,
    required String description,
    required num rate,
    required String image,
    required num price,
    required int id,
    required String category,
    required int count,
  });
  Future<Either<Failure, List<CartProductModel>>> getCart();
  Future<Either<Failure, void>> deletCartProduct({required int productId});

  Future<void> updateProduct({
    required int count,
    required int productId,
  });
}
