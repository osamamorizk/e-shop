import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_app/core/errors/failure.dart';
import 'package:shop_app/feature/authentication/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either<Failure, User>> emailPasswordLogin(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(credential.user!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        return left(Failure(errorMessage: 'Invalid credentials'));
      } else {
        return left(Failure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, User>> emailPasswordRegister(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(credential.user!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left(
            Failure(errorMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        return left(Failure(
            errorMessage: 'The account already exists for that email.'));
      } else {
        return left(Failure(errorMessage: e.toString()));
      }
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }
}
