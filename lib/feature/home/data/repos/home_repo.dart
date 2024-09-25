import 'package:dartz/dartz.dart';
import 'package:shop_app/core/errors/failure.dart';
import 'package:shop_app/feature/home/data/models/category_model.dart';
import 'package:shop_app/feature/home/data/models/product_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProductModel>>> featchAllProducts();
  Future<Either<Failure, List<CategoryModel>>> featchCategories();
  Future<Either<Failure, List<ProductModel>>> featchCategoryProducts(
      {required String categoryName});
}
