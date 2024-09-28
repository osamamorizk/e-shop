import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/widgets/custom_button.dart';
import 'package:shop_app/feature/cart/presentation/manger/cubit/cart_cubit.dart';
import 'package:shop_app/feature/cart/presentation/views/widgets/cart_product_item.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CartCubit>(context).getCartProducts();
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
                      return const CartProductItem();
                    }),
              );
            } else if (state is GetCartFailure) {
              return Text(state.errorMessage);
            } else {
              return const CircularProgressIndicator();
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
        const OrderInfo(
          info: '5000 ',
          title: 'Total price',
        ),
        const OrderInfo(
          info: '5',
          title: "Order's Number",
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: SizedBox(
              width: 200,
              height: 55,
              child: CustomButton(text: 'Checkout'),
            ),
          ),
        )
      ],
    );
  }
}

class OrderInfo extends StatelessWidget {
  const OrderInfo({
    super.key,
    required this.title,
    required this.info,
  });
  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        title,
        style: const TextStyle(fontSize: 22),
      ),
      trailing: Text(
        r'$' '$info',
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
