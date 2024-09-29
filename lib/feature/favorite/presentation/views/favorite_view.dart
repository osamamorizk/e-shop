import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/feature/favorite/presentation/manger/cubit/favorite_cubit.dart';
import 'package:shop_app/feature/favorite/presentation/views/widgets/favorite_empty.dart';
import 'package:shop_app/feature/favorite/presentation/views/widgets/favorite_list.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  void initState() {
    BlocProvider.of<FavoriteCubit>(context).getCartProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: const Text(
          'Favorite',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is GetFavoriteSuccess) {
            return BlocProvider.of<FavoriteCubit>(context)
                    .favoProducts
                    .isNotEmpty
                ? const FavoritetList()
                : const FavoriteEmpty();
          } else if (state is GetFavoriteFailure) {
            return Text(state.errorMessage);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
