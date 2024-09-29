import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/feature/cart/presentation/manger/cubit/cart_cubit.dart';
import 'package:shop_app/feature/cart/presentation/views/widgets/count_button.dart';

class ProductCount extends StatefulWidget {
  const ProductCount({
    super.key,
  });

  @override
  State<ProductCount> createState() => _ProductCountState();
}

class _ProductCountState extends State<ProductCount> {
  int count = 1;
  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: SizedBox(
            width: 110,
            child: Row(
              children: [
                CountButton(
                  onPressed: () {
                    if (count > 0) {
                      count--;
                      BlocProvider.of<CartCubit>(context).cartCount = count;
                    }
                    setState(() {});
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
                  onPressed: () {
                    setState(() {});
                    count++;
                    BlocProvider.of<CartCubit>(context).cartCount = count;
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
