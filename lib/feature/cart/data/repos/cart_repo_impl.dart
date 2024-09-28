import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/errors/failure.dart';
import 'package:shop_app/feature/cart/data/models/cart_product_model.dart';
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
    required String category,
    required int count,
  }) async {
    if (user != null) {
      String uid = user!.uid;

      var products = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('products')
          .doc(id.toString());

      try {
        await products.set(
          {
            'title': title,
            'description': description,
            'image': image,
            'price': price,
            'id': id,
            'category': category,
            'count': count,
          },
        );
        // ignore: void_checks
        return right('Done');
      } catch (e) {
        return left(Failure(errorMessage: e.toString()));
      }
    } else {
      return Left(Failure(errorMessage: 'No user logged in'));
    }
  }

  @override
  Future<Either<Failure, List<CartProductModel>>> getCart() async {
    if (user != null) {
      try {
        String uid = user!.uid;
        final QuerySnapshot<Map<String, dynamic>> productsDocs =
            await FirebaseFirestore.instance
                .collection('users')
                .doc(uid)
                .collection('products')
                .get();

        List<CartProductModel> productsList = [];

        for (var product in productsDocs.docs) {
          productsList.add(CartProductModel.fromJson(product.data()));
        }

        return right(productsList);
      } catch (e) {
        log(e.toString());
        return left(Failure(errorMessage: e.toString()));
      }
    } else {
      return left(Failure(errorMessage: 'No user loged'));
    }
  }

  @override
  Future<void> updateProduct({
    required int count,
    required int productId,
  }) async {
    String uid = user!.uid;
    final productRef = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('products')
        .doc(productId.toString());

    try {
      await productRef.update(
        {'count': count},
      );
    } on Exception catch (e) {
      Text(e.toString());
    }
  }

  @override
  Future<Either<Failure, void>> deletCartProduct(
      {required int productId}) async {
    {
      String uid = user!.uid;
      final productRef = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('products')
          .doc(productId.toString());

      try {
        await productRef.delete();
        return right(null);
      } catch (e) {
        Text(e.toString());
        return left(Failure(errorMessage: e.toString()));
      }
    }
  }
}
