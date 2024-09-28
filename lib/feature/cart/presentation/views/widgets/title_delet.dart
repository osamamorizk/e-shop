import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:shop_app/core/helpers/consts.dart';
import 'package:shop_app/feature/cart/data/models/cart_product_model.dart';
import 'package:shop_app/feature/cart/presentation/manger/cubit/cart_cubit.dart';
import 'package:shop_app/feature/cart/presentation/views/widgets/dialog_fun.dart';

class TitleAndDelet extends StatelessWidget {
  const TitleAndDelet({
    super.key,
    required this.title,
    required this.cartProductModel,
  });
  final String title;
  final CartProductModel cartProductModel;
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
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              if (state is DeleteSuccess) {
                GoRouter.of(context).pop();
              }
              return CircleAvatar(
                backgroundColor: kPrimaryColor.withOpacity(.07),
                child: IconButton(
                    onPressed: () {
                      showAlertDialog(
                        context,
                        () async {
                          GoRouter.of(context).pop();
                          await BlocProvider.of<CartCubit>(context)
                              .deleteCartProduct(
                                  productId: cartProductModel.id);
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
              );
            },
          ),
        ],
      ),
    );
  }
}
