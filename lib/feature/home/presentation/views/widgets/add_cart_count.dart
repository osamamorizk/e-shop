import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/widgets/product_count.dart';
import 'package:shop_app/feature/cart/presentation/manger/local_cart/local_cart_cubit.dart';
import 'package:shop_app/feature/home/data/models/product_model.dart';
import 'package:shop_app/feature/home/presentation/views/widgets/add_to_cart_button.dart';

class AddCartAndCount extends StatelessWidget {
  const AddCartAndCount({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    var localCartCubit = BlocProvider.of<LocalCartCubit>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(
          height: 60,
          width: 170,
          child: ProductCount(),
        ),
        AddCartButton(
          onTap: () async {
            await localCartCubit.addProductCart(context,
                productModel: productModel);
          }
          // () {
          //     Fluttertoast.showToast(
          //         msg: 'Already in cart',
          //         toastLength: Toast.LENGTH_SHORT,
          //         gravity: ToastGravity.BOTTOM,
          //         timeInSecForIosWeb: 1,
          //         backgroundColor: Colors.red,
          //         textColor: Colors.white,
          //         fontSize: 16.0);
          //   }
          ,
          productModel: productModel,
        ),
      ],
    );
  }
}
