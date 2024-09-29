import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/helpers/consts.dart';
import 'package:shop_app/core/helpers/service_locator.dart';
import 'package:shop_app/feature/cart/data/repos/cart_repo_impl.dart';
import 'package:shop_app/feature/cart/presentation/manger/cubit/cart_cubit.dart';
import 'package:shop_app/feature/favorite/data/repos/favorite_repo_impl.dart';
import 'package:shop_app/feature/favorite/presentation/manger/cubit/favorite_cubit.dart';
import 'package:shop_app/feature/home/data/repos/home_repo_impl.dart';
import 'package:shop_app/feature/home/presentation/manger/all_products/all_product_cubit.dart';
import 'package:shop_app/feature/home/presentation/manger/category_cubit/category_cubit.dart';
import 'package:shop_app/feature/home/presentation/manger/category_product/category_product_cubit_cubit.dart';
import 'package:shop_app/feature/profile/data/repos/profile_repo_impl.dart';
import 'package:shop_app/feature/profile/presentation/manger/cubit/profile_cubit.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AllProductCubit>(
          create: (BuildContext context) =>
              AllProductCubit(getIt.get<HomeRepoImpl>())..featchAllProducts(),
        ),
        BlocProvider<CategoryCubit>(
          create: (BuildContext context) =>
              CategoryCubit(getIt.get<HomeRepoImpl>())..featchCategory(),
        ),
        BlocProvider<CategoryProductCubit>(
          create: (BuildContext context) =>
              CategoryProductCubit(getIt.get<HomeRepoImpl>())
                ..featchCatProducts(categryName: 'electronics'),
        ),
        BlocProvider<CartCubit>(
          create: (BuildContext context) => CartCubit(CartRepoImpl()),
        ),
        BlocProvider<ProfileCubit>(
          create: (BuildContext context) => ProfileCubit(ProfileRepoImpl()),
        ),
        BlocProvider<FavoriteCubit>(
          create: (BuildContext context) =>
              FavoriteCubit(FavoriteRepoImpl())..getFavoProducts(),
        ),
      ],
      child: Scaffold(
        bottomNavigationBar: Container(
          height: 65,
          margin: const EdgeInsets.only(bottom: 0),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            child: Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
                iconSize: 20,
                backgroundColor: Colors.black,
                selectedIconTheme: const IconThemeData(size: 22),
                elevation: 10,
                currentIndex: currentIndex,
                selectedLabelStyle: const TextStyle(color: Colors.white),
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey[600],
                type: BottomNavigationBarType.fixed,
                onTap: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                items: bottomBarItems,
              ),
            ),
          ),
        ),
        body: screens.elementAt(currentIndex),
      ),
    );
  }
}
