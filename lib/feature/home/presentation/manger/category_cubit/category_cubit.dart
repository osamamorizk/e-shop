import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/feature/home/data/models/category_model.dart';
import 'package:shop_app/feature/home/data/repos/home_repo.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.homeRepo) : super(CategoryInitial());

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
}
