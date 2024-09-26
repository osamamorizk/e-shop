import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_app/core/errors/failure.dart';
import 'package:shop_app/feature/cart/data/repos/cart_repo.dart';

class CartRepoImpl implements CartRepo {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Future<Either<Failure, void>> addToCart({
    required String title,
    required String description,
    required num rate,
    required String image,
    required num price,
    required int id,
  }) async {
    if (user != null) {
      String uid = user!.uid;
      log(uid);
      CollectionReference products = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('products');

      try {
        await products.add(
          {
            'title': title,
            'description': description,
            'rate': rate,
            'image': image,
            'price': price,
            'id': id
          },
        );
        return right('Done');
      } catch (e) {
        log(e.toString());
        return left(Failure(errorMessage: e.toString()));
      }
    } else {
      log('No User loged In');
      return Left(Failure(errorMessage: 'No user logged in'));
    }
  }

  @override
  Future<Either<Failure, QuerySnapshot<Object?>>> getCart() {
    // TODO: implement getCart
    throw UnimplementedError();
  }
}
