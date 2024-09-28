import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_app/core/errors/failure.dart';
import 'package:shop_app/feature/profile/data/repos/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Future<Either<Failure, void>> signout() async {
    try {
      await FirebaseAuth.instance.signOut();
      return right(null);
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String?>> getProfile() async {
    if (user != null) {
      try {
        final email = user!.email;
        return right(email);
      } catch (e) {
        return left(Failure(errorMessage: e.toString()));
      }
    }
    return left(Failure(errorMessage: 'No user loged'));
  }
}
