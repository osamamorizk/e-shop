import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/core/helpers/consts.dart';
import 'package:shop_app/feature/favorite/presentation/manger/cubit/favorite_cubit.dart';
import 'package:shop_app/feature/home/data/models/product_model.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({
    super.key,
    this.onPressed,
    required this.productModel,
  });
  final void Function()? onPressed;
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    final favcubit = BlocProvider.of<FavoriteCubit>(context);

    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        return CircleAvatar(
          backgroundColor: kPrimaryColor.withOpacity(.07),
          child: IconButton(
              onPressed: favcubit.isFavorite(productModel: productModel)
                  ? () async {
                      await BlocProvider.of<FavoriteCubit>(context)
                          .deleteCartProduct(productId: productModel.id);
                      await favcubit.getFavoProducts();
                    }
                  : () async {
                      await BlocProvider.of<FavoriteCubit>(context)
                          .addToFav(productModel: productModel);
                      await favcubit.getFavoProducts();
                    },
              icon: favcubit.isFavorite(productModel: productModel)
                  ? const Icon(
                      FontAwesomeIcons.solidHeart,
                      color: Colors.red,
                    )
                  : const Icon(
                      FontAwesomeIcons.heart,
                      color: Colors.black,
                    )),
        );
      },
    );
  }
}
