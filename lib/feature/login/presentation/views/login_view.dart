import 'package:flutter/material.dart';
import 'package:shop_app/feature/login/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/images/quickmart.png'),
        ),
        body: const LoginViewBody());
  }
}
