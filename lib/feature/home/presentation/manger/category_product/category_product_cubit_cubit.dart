import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/feature/home/data/models/product_model.dart';
import 'package:shop_app/feature/home/data/repos/home_repo.dart';

part 'category_product_cubit_state.dart';

class CategoryProductCubit extends Cubit<CategoryProductState> {
  CategoryProductCubit(this.homeRepo) : super(CategoryCubitInitial());
  final HomeRepo homeRepo;
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
