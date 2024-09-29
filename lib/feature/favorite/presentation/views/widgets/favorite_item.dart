import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/core/Routing/routes.dart';
import 'package:shop_app/core/widgets/favorite_item.dart';
import 'package:shop_app/feature/cart/presentation/manger/cubit/cart_cubit.dart';
import 'package:shop_app/feature/home/data/models/product_model.dart';
import 'package:shop_app/core/widgets/product_count.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(Routes.productDetailsView, extra: productModel);
      },
      child: Padding(
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
                  BlocConsumer<CartCubit, CartState>(
                    listener: (context, state) {
                      if (state is CartAddSuccess) {
                        Fluttertoast.showToast(
                            msg: "Added Successfluy",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 18.0);
                      }
                    },
                    builder: (context, state) {
                      return IconButton(
                        onPressed: () async {
                          await cartCubit.addProductCart(
                            title: productModel.title,
                            description: productModel.description,
                            rate: productModel.rate,
                            image: productModel.image,
                            price: productModel.price,
                            id: productModel.id,
                            category: productModel.category,
                            count:
                                BlocProvider.of<CartCubit>(context).cartCount,
                          );
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
      ),
    );
  }
}

class CountAndPrice extends StatelessWidget {
  const CountAndPrice({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            productModel.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 180,
            child: Row(
              children: [
                Text(
                  r'$' '${productModel.price}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                Spacer(),
                ProductCount()
              ],
            ),
          )
        ],
      ),
    );
  }
}
