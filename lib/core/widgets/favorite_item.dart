import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/core/helpers/consts.dart';
import 'package:shop_app/feature/favorite/presentation/manger/cubit/favorite_cubit.dart';
import 'package:shop_app/feature/home/data/models/product_model.dart';

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({
    super.key,
    this.onPressed,
    required this.productModel,
  });
  final void Function()? onPressed;
  final ProductModel productModel;
  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool isFavo = true;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: kPrimaryColor.withOpacity(.07),
        child: IconButton(
            onPressed: () async {
              isFavo = !isFavo;
              setState(() {});
              await BlocProvider.of<FavoriteCubit>(context)
                  .addToFav(productModel: widget.productModel);
            },
            icon: isFavo
                ? const Icon(
                    FontAwesomeIcons.heart,
                    color: Colors.black,
                  )
                : const Icon(
                    FontAwesomeIcons.solidHeart,
                    color: Colors.red,
                  )));
  }
}
