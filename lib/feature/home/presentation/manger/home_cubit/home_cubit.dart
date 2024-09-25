import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/feature/home/data/models/category_model.dart';
import 'package:shop_app/feature/home/data/models/product_model.dart';
import 'package:shop_app/feature/home/data/repos/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());

  final HomeRepo homeRepo;
  Future<void> featchCategory() async {
    emit(LoadingCategory());
    var result = await homeRepo.featchCategories();
    result.fold(
      (failure) {
        emit(FailureCategory(errorMessage: failure.errorMessage));
      },
      (category) {
        emit(SuccessCategory(categories: category));
      },
    );
  }

  Future<void> featchAllProducts() async {
    emit(LoadingAllProducts());
    var result = await homeRepo.featchAllProducts();
    result.fold(
      (failure) {
        emit(FailureAllProducts(errorMessage: failure.errorMessage));
      },
      (product) {
        emit(SucessAllProducts(allProducts: product));
      },
    );
  }

  Future<void> featchCatProducts({required String categryName}) async {
    emit(LoadingCatProduct());
    var result =
        await homeRepo.featchCategoryProducts(categoryName: categryName);
    result.fold(
      (failure) {
        emit(FailureCatProduct(errorMessage: failure.errorMessage));
      },
      (product) {
        emit(SucessCatProduct(catProducts: product));
      },
    );
  }
}
