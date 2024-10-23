import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:shop_app/core/errors/failure.dart';
import 'package:shop_app/core/helpers/consts.dart';
import 'package:shop_app/feature/cart/data/repos/cart_repo.dart';
import 'package:shop_app/feature/cart/presentation/manger/local_cart/local_cart_cubit.dart';
import 'package:shop_app/feature/home/data/models/product_model.dart';

class CartRepoImpl implements CartRepo {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Future<Either<Failure, void>> addToCart(
    context, {
    required String title,
    required String description,
    required num rate,
    required String image,
    required num price,
    required int id,
    required String category,
    required int count,
  }) async {
    var cart = Hive.box<ProductModel>(cartBox);

    try {
      int productIndex =
          cart.values.toList().indexWhere((product) => product.id == id);

      if (productIndex != -1) {
        ProductModel existingProduct = cart.getAt(productIndex)!;
        ProductModel updatedProduct = existingProduct.copyWith(
          count: BlocProvider.of<LocalCartCubit>(context).productCount,
        );
        // await cart.add(updatedProduct);

        await cart.putAt(productIndex, updatedProduct);
      } else {
        ProductModel newProduct = ProductModel(
          id: id,
          title: title,
          description: description,
          rate: rate,
          image: image,
          price: price,
          category: category,
          count: BlocProvider.of<LocalCartCubit>(context).productCount,
        );

        await cart.add(newProduct);
      }

      return right(null);
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getCart() async {
    var cart = Hive.box<ProductModel>(cartBox);
    List<ProductModel> products = [];

    try {
      products = cart.values.toList();
      return right(products);
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deletCartProduct(
      {required ProductModel productModel}) async {
    var cart = Hive.box<ProductModel>(cartBox);
    int productIndex = cart.values
        .toList()
        .indexWhere((product) => product.id == productModel.id);
    try {
      await cart.deleteAt(productIndex);
      return right(null);
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateProductCount(
      {required BuildContext context,
      required ProductModel productModel,
      required bool increment}) async {
    var cart = Hive.box<ProductModel>(cartBox);
    try {
      int productIndex = cart.values
          .toList()
          .indexWhere((product) => product.id == productModel.id);
      if (productIndex != -1) {
        ProductModel? existProduct = cart.getAt(productIndex);
        int newCount = increment
            ? existProduct!.count + 1
            : existProduct!.count > 1
                ? existProduct.count - 1
                : 1;

        ProductModel updatedProduct = existProduct.copyWith(count: newCount);
        await cart.putAt(productIndex, updatedProduct);
        await BlocProvider.of<LocalCartCubit>(context).getCartProducts();
      }
      return right(null);
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }
}
 // @override
  // Future<Either<Failure, void>> addToCart(
  //     {required ProductModel productModel}) async {
  //   var cart = Hive.box<ProductModel>(cartBox);
  //   try {
  //     await cart.add(productModel);
  //     return right('Done');
  //   } catch (e) {
  //     if (e is HiveError) {
  //       return left(ServerFailure.fromHive(e));

  //     }
  //     return left(Failure(errorMessage: e.toString()));
  //   }
  // }

//  @override
//   Future<Either<Failure, List<CartProductModel>>> getCart() async {
//     if (user != null) {
//       try {
//         String uid = user!.uid;
//         final QuerySnapshot<Map<String, dynamic>> productsDocs =
//             await FirebaseFirestore.instance
//                 .collection('users')
//                 .doc(uid)
//                 .collection('products')
//                 .get();

//         List<CartProductModel> productsList = [];

//         for (var product in productsDocs.docs) {
//           productsList.add(CartProductModel.fromJson(product.data()));
//         }

//         return right(productsList);
//       } catch (e) {
//         log(e.toString());
//         return left(Failure(errorMessage: e.toString()));
//       }
//     } else {
//       return left(Failure(errorMessage: 'No user loged'));
//     }
//   }




// @override
  // Future<Either<Failure, void>> addToCart({
  //   required String title,
  //   required String description,
  //   required num rate,
  //   required String image,
  //   required num price,
  //   required int id,
  //   required String category,
  //   required int count,
  // }) async {
  //   if (user != null) {
  //     String uid = user!.uid;

  //     var products = FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(uid)
  //         .collection('products')
  //         .doc(id.toString());

  //     try {
  //       await products.set(
  //         {
  //           'title': title,
  //           'description': description,
  //           'image': image,
  //           'price': price,
  //           'id': id,
  //           'category': category,
  //           'count': count,
  //         },
  //       );
  //       // ignore: void_checks
  //       return right('Done');
  //     } catch (e) {
  //       return left(Failure(errorMessage: e.toString()));
  //     }
  //   } else {
  //     return Left(Failure(errorMessage: 'No user logged in'));
  //   }
  // }


  //   @override
  // Future<Either<Failure, void>> deletCartProduct(
  //     {required int productId}) async {
  //   {
  //     String uid = user!.uid;
  //     final productRef = FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(uid)
  //         .collection('products')
  //         .doc(productId.toString());

  //     try {
  //       await productRef.delete();
  //       return right(null);
  //     } catch (e) {
  //       Text(e.toString());
  //       return left(Failure(errorMessage: e.toString()));
  //     }
  //   }
  // }
  // @override
  // Future<void> updateProduct({
  //   required int count,
  //   required int productId,
  // }) async {
  //   String uid = user!.uid;
  //   final productRef = FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(uid)
  //       .collection('products')
  //       .doc(productId.toString());

  //   try {
  //     await productRef.update(
  //       {'count': count},
  //     );
  //   } on Exception catch (e) {
  //     Text(e.toString());
  //   }
  // }
