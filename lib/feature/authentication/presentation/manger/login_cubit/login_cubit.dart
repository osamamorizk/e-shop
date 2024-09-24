import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/feature/authentication/data/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.auhtRepo) : super(LoginInitial());
  final AuthRepo auhtRepo;
  Future login({required String email, required String password}) async {
    emit(LoginLoading());
    var result =
        await auhtRepo.emailPasswordLogin(email: email, password: password);

    result.fold(
      (failure) {
        emit(LoginFailure(errorMessage: failure.errorMessage));
      },
      (user) {
        emit(LoginSuccess(user: user));
      },
    );
  }
}
