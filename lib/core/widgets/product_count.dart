import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/feature/cart/presentation/manger/local_cart/local_cart_cubit.dart';
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
  Widget build(BuildContext context) {
    return BlocBuilder<LocalCartCubit, LocalCartState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: SizedBox(
            width: 110,
            child: Row(
              children: [
                CountButton(
                  onPressed: () {
                    if (count > 1) {
                      count--;
                      BlocProvider.of<LocalCartCubit>(context).productCount =
                          count;
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
                    BlocProvider.of<LocalCartCubit>(context).productCount =
                        count;
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
