import 'package:dartz/dartz.dart';
import 'package:shop_app/core/errors/failure.dart';
import 'package:shop_app/feature/home/data/models/product_model.dart';

abstract class FavoriteRepo {
  Future<Either<Failure, void>> addToFavorite({ProductModel productModel});
  Future<Either<Failure, List<ProductModel>>> getFavorite();
  Future<Either<Failure, void>> deletFavoriteProduct({required int productId});
}
