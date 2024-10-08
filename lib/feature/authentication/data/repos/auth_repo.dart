import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_app/core/errors/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, User>> emailPasswordLogin(
      {required String email, required String password});

  Future<Either<Failure, User>> emailPasswordRegister(
      {required String email, required String password});
}
