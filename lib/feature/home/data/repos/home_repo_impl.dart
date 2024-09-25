import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_app/core/errors/failure.dart';
import 'package:shop_app/core/helpers/api_service.dart';
import 'package:shop_app/feature/home/data/models/category_model.dart';
import 'package:shop_app/feature/home/data/models/product_model.dart';
import 'package:shop_app/feature/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<ProductModel>>> featchAllProducts() async {
    try {
      var data = await apiService.get(endPoints: 'products');

      List<ProductModel> allProductsList = [];
      for (var product in data) {
        allProductsList.add(ProductModel.fromJson(product));
      }

      return right(allProductsList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> featchCategories() async {
    try {
      var data = await apiService.get(endPoints: 'products/categories');

      List<CategoryModel> categoriesList = [];
      for (var product in data) {
        categoriesList.add(CategoryModel.fromJson(product));
      }

      return right(categoriesList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> featchCategoryProducts(
      {required String categoryName}) async {
    try {
      var data =
          await apiService.get(endPoints: 'products/category/$categoryName');

      List<ProductModel> categoryProductsList = [];
      for (var product in data) {
        categoryProductsList.add(ProductModel.fromJson(product));
      }

      return right(categoryProductsList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
