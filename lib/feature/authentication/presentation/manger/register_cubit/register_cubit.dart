import 'package:bloc/bloc.dart';
import 'package:shop_app/feature/authentication/data/repos/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitial());

  final AuthRepo authRepo;

  Future<void> registerWithEmailPass(
      {required String email, required String password}) async {
    emit(RegisterLoading());
    var result =
        await authRepo.emailPasswordRegister(email: email, password: password);

    result.fold(
      (failure) {
        emit(RegisterFailure(errorMessage: failure.errorMessage));
      },
      (user) {
        emit(RegisterSucess());
      },
    );
  }
}
