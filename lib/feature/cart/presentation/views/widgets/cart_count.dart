import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/feature/cart/data/models/cart_product_model.dart';
import 'package:shop_app/feature/cart/presentation/manger/cubit/cart_cubit.dart';
import 'package:shop_app/feature/cart/presentation/views/widgets/count_button.dart';

class CartCount extends StatefulWidget {
  const CartCount({
    super.key,
    required this.count,
    required this.cartProductModel,
  });
  final int count;
  final CartProductModel cartProductModel;

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
    return BlocBuilder<CartCubit, CartState>(
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
                      await BlocProvider.of<CartCubit>(context)
                          .updateCartProducts(
                              count: count,
                              productId: widget.cartProductModel.id);
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
                    await BlocProvider.of<CartCubit>(context)
                        .updateCartProducts(
                            count: count,
                            productId: widget.cartProductModel.id);
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
