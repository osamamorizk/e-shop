import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_app/core/errors/failure.dart';
import 'package:shop_app/feature/login/data/repos/login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  @override
  Future<Either<Failure, User>> emailPasswordLogin(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return right(credential.user!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        return left(Failure(errorMessage: 'Invalid credentials'));
      } else {
        return left(Failure(errorMessage: e.toString()));
      }
    }
  }
}
