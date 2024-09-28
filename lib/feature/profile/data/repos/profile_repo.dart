import 'package:dartz/dartz.dart';
import 'package:shop_app/core/errors/failure.dart';

abstract class ProfileRepo {
  Future<Either<Failure, void>> signout();
  Future<Either<Failure, String?>> getProfile();
}
