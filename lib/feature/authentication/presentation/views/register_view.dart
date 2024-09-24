import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/feature/authentication/data/repos/auth_repo_impl.dart';
import 'package:shop_app/feature/authentication/presentation/manger/register_cubit/register_cubit.dart';
import 'package:shop_app/feature/authentication/presentation/views/widgets/register_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(AuthRepoImpl()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          title: Image.asset(height: 42, 'assets/images/quickmart1.5.png'),
        ),
        body: const RegisterViewBody(),
      ),
    );
  }
}
