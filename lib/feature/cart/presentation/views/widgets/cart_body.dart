import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/core/widgets/custom_button.dart';
import 'package:shop_app/feature/cart/presentation/manger/local_cart/local_cart_cubit.dart';
import 'package:shop_app/feature/cart/presentation/views/widgets/cart_product_item.dart';
import 'package:shop_app/feature/cart/presentation/views/widgets/order_info.dart';
import 'package:shop_app/feature/home/data/models/product_model.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    var localCartCubit = BlocProvider.of<LocalCartCubit>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<LocalCartCubit, LocalCartState>(
          builder: (context, state) {
            if (state is GetLocalCartSuccess) {
              return SizedBox(
                height: (MediaQuery.of(context).size.height) - 370,
                child: ListView.builder(
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      return CartProductItem(
                        cartProductModel: state.products[index],
                      );
                    }),
              );
            } else if (state is GetLocalCartFailure) {
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
        BlocBuilder<LocalCartCubit, LocalCartState>(
          builder: (context, state) {
            return Column(
              children: [
                OrderInfo(
                  info:
                      r'$ ' '${getPrice(localCartCubit.productsList).toInt()} ',
                  title: 'Total price',
                ),
                OrderInfo(
                  info: '${numOfOrders(localCartCubit.productsList)}',
                  title: "Order's Number",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Center(
                    child: SizedBox(
                      width: 210,
                      height: 50,
                      child: CustomButton(
                          onTap: () {
                            Fluttertoast.showToast(
                                msg: "Payment will active soon",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 18.0);
                          },
                          text:
                              'Checkout    (${numOfOrders(localCartCubit.productsList)})'),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

num getPrice(List<ProductModel> products) {
  num price = 0;
  for (var product in products) {
    price = price + product.price * product.count;
  }
  return price;
}

int numOfOrders(List<ProductModel> products) {
  int orders = 0;
  for (var product in products) {
    orders = orders + product.count;
  }
  return orders;
}
