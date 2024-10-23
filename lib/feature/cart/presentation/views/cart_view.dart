import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/feature/cart/presentation/manger/local_cart/local_cart_cubit.dart';
import 'package:shop_app/feature/cart/presentation/views/widgets/cart_body.dart';
import 'package:shop_app/feature/cart/presentation/views/widgets/empty_cart.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<LocalCartCubit>(context).getCartProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0,
          title: const Text(
            'Cart',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        body: BlocBuilder<LocalCartCubit, LocalCartState>(
          builder: (context, state) {
            if (state is GetLocalCartSuccess) {
              return BlocProvider.of<LocalCartCubit>(context)
                      .productsList
                      .isEmpty
                  ? const EmptyCart()
                  : const CartBody();
            } else if (state is GetLocalCartFailure) {
              return Text(state.errorMessage);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
