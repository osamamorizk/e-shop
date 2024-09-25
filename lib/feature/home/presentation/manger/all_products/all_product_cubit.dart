import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/feature/home/data/models/product_model.dart';
import 'package:shop_app/feature/home/data/repos/home_repo.dart';

part 'all_product_state.dart';

class AllProductCubit extends Cubit<AllProductState> {
  AllProductCubit(this.homeRepo) : super(AllProductInitial());

  final HomeRepo homeRepo;
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
}
