import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/core/helpers/service_locator.dart';
import 'package:shop_app/feature/home/data/repos/home_repo_impl.dart';
import 'package:shop_app/feature/home/presentation/manger/all_products/all_product_cubit.dart';
import 'package:shop_app/feature/home/presentation/manger/category_cubit/category_cubit.dart';
import 'package:shop_app/feature/home/presentation/manger/category_product/category_product_cubit_cubit.dart';
import 'package:shop_app/feature/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
      ],
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Image.asset(height: 42, 'assets/images/quickmart1.5.png'),
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                color: Color(0xff22D4B4),
                FontAwesomeIcons.magnifyingGlass,
                size: 28,
              ),
            )
          ],
        ),
        body: HomeViewBody(),
      ),
    );
  }
}
