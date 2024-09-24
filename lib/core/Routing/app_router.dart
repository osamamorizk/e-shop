import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/core/Routing/routes.dart';
import 'package:shop_app/core/helpers/consts.dart';
import 'package:shop_app/feature/home/presentation/views/home_view.dart';
import 'package:shop_app/feature/authentication/presentation/views/login_view.dart';
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
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: Routes.loginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: Routes.registerView,
        builder: (context, state) => const RegisterView(),
      ),
    ],
    // redirect: (context, state) {
    //   if (!onboard) {
    //     return Routes.onbarding;
    //   } else if (auth.currentUser != null) {
    //     return Routes.homeView;
    //   } else {
    //     return Routes.loginView;
    //   }
    // },
  );
}
