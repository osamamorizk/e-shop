import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/core/Routing/routes.dart';
import 'package:shop_app/core/helpers/styles.dart';
import 'package:shop_app/core/widgets/custom_button.dart';
import 'package:shop_app/feature/authentication/presentation/manger/login_cubit/login_cubit.dart';
import 'package:shop_app/core/widgets/custom_text_form.dart';
import 'package:shop_app/feature/authentication/presentation/views/widgets/dont_have_account.dart';
import 'package:shop_app/feature/authentication/presentation/views/widgets/auth_google.dart';
import 'package:shop_app/feature/authentication/presentation/views/widgets/or_widget.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isVisable = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: formKey,
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Text(
              "Login to your account",
              style: Styles.styleBold30,
            ),
            const Text(
              "It's great to see you again",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 50),
            Text(
              "Email",
              style: Styles.styleBold30.copyWith(
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 8),
            CustomTextField(
              controller: emailController,
              hintText: 'Enter your Email',
            ),
            const SizedBox(height: 25),
            Text(
              "Password",
              style: Styles.styleBold30.copyWith(
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 8),
            CustomTextField(
              obscureText: isVisable,
              controller: passwordController,
              hintText: 'Enter your Password',
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isVisable = !isVisable;
                  });
                },
                icon: isVisable
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              ),
            ),
            const SizedBox(height: 30),
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  GoRouter.of(context).push(Routes.homeView);
                  Fluttertoast.showToast(
                      msg: "Login Successfuly",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0);
                } else if (state is LoginFailure) {
                  Fluttertoast.showToast(
                      msg: state.errorMessage,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
              },
              builder: (context, state) {
                return CustomButton(
                  text: 'Login',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<LoginCubit>(context).login(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    }
                  },
                );
              },
            ),
            const SizedBox(height: 15),
            const OrWidget(),
            const SizedBox(height: 15),
            const AuthWithGoogle(
              text: 'Login with google',
            ),
            const SizedBox(height: 15),
            DontHaveAccount(
              onPressed: () {
                GoRouter.of(context).push(Routes.registerView);
              },
            ),
          ],
        ),
      ),
    );
  }
}
