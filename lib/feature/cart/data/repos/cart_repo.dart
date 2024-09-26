import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:shop_app/core/errors/failure.dart';

abstract class CartRepo {
  Future<Either<Failure, void>> addToCart({
    required String title,
    required String description,
    required num rate,
    required String image,
    required num price,
    required int id,
  });
  Future<Either<Failure, QuerySnapshot>> getCart();
}
