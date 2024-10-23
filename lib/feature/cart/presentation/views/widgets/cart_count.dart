import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_app/feature/cart/presentation/manger/local_cart/local_cart_cubit.dart';
import 'package:shop_app/feature/cart/presentation/views/widgets/count_button.dart';
import 'package:shop_app/feature/home/data/models/product_model.dart';

class CartCount extends StatefulWidget {
  const CartCount({
    super.key,
    required this.count,
    required this.cartProductModel,
  });
  final int count;
  final ProductModel cartProductModel;

  @override
  State<CartCount> createState() => _CartCountState();
}

class _CartCountState extends State<CartCount> {
  late int count;
  @override
  void initState() {
    count = widget.count;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalCartCubit, LocalCartState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: 120,
            child: Row(
              children: [
                CountButton(
                  onPressed: () async {
                    if (count > 1) {
                      count--;
                      setState(() {});
                      // await BlocProvider.of<CartCubit>(context)
                      //     .updateCartProducts(
                      //         count: count,
                      //         productId: widget.cartProductModel.id);
                      // await BlocProvider.of<LocalCartCubit>(context)
                      //     .addProductCart(context,
                      //         productModel: widget.cartProductModel);
                      // await BlocProvider.of<LocalCartCubit>(context)
                      //     .getCartProducts();
                      await BlocProvider.of<LocalCartCubit>(context)
                          .updateCartCount(
                              context: context,
                              productModel: widget.cartProductModel,
                              increment: false);
                    }
                  },
                  icon: Icons.remove,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  height: 35,
                  width: 35,
                  child: Center(
                      child: Text(
                    '$count',
                    style: const TextStyle(fontSize: 20),
                  )),
                ),
                CountButton(
                  onPressed: () async {
                    setState(() {});
                    count++;
                    await BlocProvider.of<LocalCartCubit>(context)
                        .updateCartCount(
                            context: context,
                            productModel: widget.cartProductModel,
                            increment: true);

                    // await BlocProvider.of<LocalCartCubit>(context)
                    //     .addProductCart(context,
                    //         productModel: widget.cartProductModel);
                    // await BlocProvider.of<LocalCartCubit>(context)
                    //     .getCartProducts();
                  },
                  icon: Icons.add,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
