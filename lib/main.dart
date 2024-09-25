import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/Routing/app_router.dart';
import 'package:shop_app/core/helpers/cashe_hlper.dart';
import 'package:shop_app/core/helpers/consts.dart';
import 'package:shop_app/core/helpers/service_locator.dart';

void main() async {
  setupGetIt();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  WidgetsFlutterBinding.ensureInitialized();
  await CasheHlper.casheIntialization();
  onboard = CasheHlper.getData(key: 'onboarding') ?? false;
  runApp(const MarketAPP());
}

class MarketAPP extends StatelessWidget {
  const MarketAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
