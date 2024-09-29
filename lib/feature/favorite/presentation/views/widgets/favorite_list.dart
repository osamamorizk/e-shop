import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/feature/favorite/presentation/manger/cubit/favorite_cubit.dart';
import 'package:shop_app/feature/favorite/presentation/views/widgets/favorite_item.dart';

import 'package:shop_app/feature/home/presentation/views/widgets/skeletonizer_latest_product.dart';

class FavoritetList extends StatelessWidget {
  const FavoritetList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (state is GetFavoriteSuccess) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: state.favoProducts.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(left: 0),
              child: GestureDetector(
                  onTap: () {},
                  child: FavoriteItem(productModel: state.favoProducts[index])),
            ),
          );
        } else if (state is GetFavoriteFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return const SizedBox(child: SkeletonizerLatestProduct());
        }
      },
    );
  }
}
