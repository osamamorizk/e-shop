import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_app/core/errors/failure.dart';
import 'package:shop_app/feature/favorite/data/repos/favorite_repo.dart';
import 'package:shop_app/feature/home/data/models/product_model.dart';

class FavoriteRepoImpl implements FavoriteRepo {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Future<Either<Failure, void>> addToFavorite(
      {ProductModel? productModel}) async {
    if (user != null) {
      String uid = user!.uid;

      var favoProducts = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('favoProducts')
          .doc(productModel!.id.toString());

      try {
        await favoProducts.set(
          {
            'title': productModel.title,
            'description': productModel.description,
            'image': productModel.image,
            'price': productModel.price,
            'id': productModel.id,
            'category': productModel.category,
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
  Future<Either<Failure, List<ProductModel>>> getFavorite() async {
    if (user != null) {
      try {
        String uid = user!.uid;
        final QuerySnapshot<Map<String, dynamic>> productsDocs =
            await FirebaseFirestore.instance
                .collection('users')
                .doc(uid)
                .collection('favoProducts')
                .get();

        List<ProductModel> favProductsList = [];

        for (var product in productsDocs.docs) {
          favProductsList.add(ProductModel.fromFavo(product.data()));
        }

        return right(favProductsList);
      } catch (e) {
        return left(Failure(errorMessage: e.toString()));
      }
    } else {
      return left(Failure(errorMessage: 'No user loged'));
    }
  }
}
