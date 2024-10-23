import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:shop_app/core/widgets/favorite_icon.dart';
import 'package:shop_app/feature/cart/presentation/manger/fire_cart/cart_cubit.dart';
import 'package:shop_app/feature/cart/presentation/manger/local_cart/local_cart_cubit.dart';
import 'package:shop_app/feature/favorite/presentation/views/widgets/count_price.dart';
import 'package:shop_app/feature/home/data/models/product_model.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    var localCartCubit = BlocProvider.of<LocalCartCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        height: 120,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 110,
              width: 80,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(productModel.image)),
            ),
            CountAndPrice(productModel: productModel),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FavoriteIcon(
                  productModel: productModel,
                ),
                BlocConsumer<LocalCartCubit, LocalCartState>(
                  listener: (context, state) {
                    if (state is LocalCartSuccess) {
                      Fluttertoast.showToast(
                          msg: "Added Successfluy",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 18.0);
                    } else if (state is LocalCartFailure) {
                      Fluttertoast.showToast(
                          msg: state.errorMessage,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 18.0);
                    }
                  },
                  builder: (context, state) {
                    return IconButton(
                      onPressed: () async {
                        await localCartCubit.addProductCart(context,
                            productModel: productModel);
                      },
                      icon: const Icon(
                        Icons.add_shopping_cart,
                        size: 32,
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
