import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/widgets/custom_button.dart';
import 'package:shop_app/feature/cart/data/models/cart_product_model.dart';
import 'package:shop_app/feature/cart/presentation/manger/cubit/cart_cubit.dart';
import 'package:shop_app/feature/cart/presentation/views/widgets/cart_product_item.dart';
import 'package:shop_app/feature/cart/presentation/views/widgets/order_info.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is GetCartSuccess) {
              return SizedBox(
                height: (MediaQuery.of(context).size.height) - 365,
                child: ListView.builder(
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      return CartProductItem(
                        cartProductModel: state.products[index],
                      );
                    }),
              );
            } else if (state is GetCartFailure) {
              return Text(state.errorMessage);
            } else {
              return SizedBox(
                  height: (MediaQuery.of(context).size.height) - 365,
                  child: const Center(child: CircularProgressIndicator()));
            }
          },
        ),
        const SizedBox(height: 5),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'Order Info',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return Column(
              children: [
                OrderInfo(
                  info: r'$ ' '${getPrice(cartCubit.productsList).toInt()} ',
                  title: 'Total price',
                ),
                OrderInfo(
                  info: '${numOfOrders(cartCubit.productsList)}',
                  title: "Order's Number",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Center(
                    child: SizedBox(
                      width: 210,
                      height: 55,
                      child: CustomButton(
                          text:
                              'Checkout    (${numOfOrders(cartCubit.productsList)})'),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ],
    );
  }
}

num getPrice(List<CartProductModel> products) {
  num price = 0;
  for (var product in products) {
    price = price + product.price * product.count;
  }
  return price;
}

int numOfOrders(List<CartProductModel> products) {
  int orders = 0;
  for (var product in products) {
    orders = orders + product.count;
  }
  return orders;
}
