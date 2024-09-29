import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/core/Routing/routes.dart';
import 'package:shop_app/core/helpers/consts.dart';
import 'package:shop_app/core/widgets/bottom_bar.dart';
import 'package:shop_app/feature/authentication/presentation/views/login_view.dart';
import 'package:shop_app/feature/cart/data/repos/cart_repo_impl.dart';
import 'package:shop_app/feature/cart/presentation/manger/cubit/cart_cubit.dart';
import 'package:shop_app/feature/cart/presentation/views/cart_view.dart';
import 'package:shop_app/feature/favorite/presentation/views/favorite_view.dart';
import 'package:shop_app/feature/home/data/models/product_model.dart';
import 'package:shop_app/feature/home/presentation/views/product_details_view.dart';
import 'package:shop_app/feature/onboarding/presentation/views/onboarding_view.dart';
import 'package:shop_app/feature/authentication/presentation/views/register_view.dart';

class AppRouter {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static final GoRouter router = GoRouter(
    initialLocation: onboard
        ? (auth.currentUser != null)
            ? Routes.homeView
            : Routes.loginView
        : Routes.onbarding,
    routes: [
      GoRoute(
        path: Routes.onbarding,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: Routes.homeView,
        builder: (context, state) => const BottomBar(),
      ),
      GoRoute(
        path: Routes.loginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: Routes.registerView,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: Routes.productDetailsView,
        builder: (context, state) => ProductDetailsView(
          productModel: state.extra as ProductModel,
        ),
      ),
      GoRoute(
        path: Routes.cartView,
        builder: (context, state) => BlocProvider(
          create: (context) => CartCubit(CartRepoImpl()),
          child: const CartView(),
        ),
      ),
      GoRoute(
        path: Routes.favoriteView,
        builder: (context, state) => const FavoriteView(),
      ),
    ],
  );
}
