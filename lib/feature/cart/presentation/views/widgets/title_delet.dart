import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:shop_app/core/helpers/consts.dart';
import 'package:shop_app/core/functions/dialog_fun.dart';
import 'package:shop_app/feature/cart/presentation/manger/local_cart/local_cart_cubit.dart';
import 'package:shop_app/feature/home/data/models/product_model.dart';

class TitleAndDelet extends StatelessWidget {
  const TitleAndDelet({
    super.key,
    required this.title,
    required this.cartProductModel,
  });
  final String title;
  final ProductModel cartProductModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 140,
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          CircleAvatar(
            backgroundColor: kPrimaryColor.withOpacity(.07),
            child: IconButton(
                onPressed: () {
                  showAlertDialog(
                    context,
                    () async {
                      await BlocProvider.of<LocalCartCubit>(context)
                          .deleteCart(productModel: cartProductModel);

                      await BlocProvider.of<LocalCartCubit>(context)
                          .getCartProducts();

                      GoRouter.of(context).pop();
                    },
                    'Delete',
                    'Do you want to delete item?',
                  );
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
          )
        ],
      ),
    );
  }
}
