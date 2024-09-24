import 'package:flutter/material.dart';
import 'package:shop_app/feature/login/data/repos/login_repo_impl.dart';
import 'package:shop_app/feature/login/presentation/manger/login_cubit/login_cubit.dart';
import 'package:shop_app/feature/login/presentation/views/widgets/login_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(LoginRepoImpl()),
      child: Scaffold(
          appBar: AppBar(
            title: Image.asset(height: 42, 'assets/images/quickmart1.5.png'),
          ),
          body: const LoginViewBody()),
    );
  }
}
