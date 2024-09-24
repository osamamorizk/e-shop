import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/core/Routing/routes.dart';
import 'package:shop_app/core/helpers/styles.dart';
import 'package:shop_app/core/widgets/custom_button.dart';
import 'package:shop_app/core/widgets/custom_text_form.dart';
import 'package:shop_app/feature/authentication/presentation/manger/register_cubit/register_cubit.dart';
import 'package:shop_app/feature/authentication/presentation/views/widgets/auth_google.dart';
import 'package:shop_app/feature/authentication/presentation/views/widgets/or_widget.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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
              "Create an account",
              style: Styles.styleBold30,
            ),
            const Text(
              "Lets create your account",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 50),
            // Text(
            //   "Name",
            //   style: Styles.styleBold30.copyWith(
            //     fontSize: 17,
            //   ),
            // ),
            // const SizedBox(height: 8),
            // CustomTextField(
            //   controller: emailController,
            //   hintText: 'Enter your Name',
            // ),
            // const SizedBox(height: 25),
            Text(
              "Email",
              style: Styles.styleBold30.copyWith(
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 8),
            CustomTextField(
              validator: (value) {
                if (value!.isEmpty) return 'Feild required';
              },
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
              validator: (value) {
                if (value!.isEmpty) return 'Feild required';
              },
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
            const SizedBox(height: 25),
            Text(
              "Confirm password",
              style: Styles.styleBold30.copyWith(
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 8),
            CustomTextField(
              controller: confirmPasswordController,
              validator: (value) {
                if (value!.isEmpty) return 'Feild required';
                if (value != passwordController.text) return 'Not matched';
              },
              obscureText: isVisable,
              hintText: 'Enter password again',
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
            BlocConsumer<RegisterCubit, RegisterState>(
              listener: (context, state) {
                if (state is RegisterSucess) {
                  GoRouter.of(context).push(Routes.homeView);
                  Fluttertoast.showToast(
                      msg: "Register Successfuly",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0);
                } else if (state is RegisterFailure) {
                  Fluttertoast.showToast(
                      msg: state.errorMessage,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
              },
              builder: (context, state) {
                return ConditionalBuilder(
                  condition: state is! RegisterLoading,
                  builder: (context) => CustomButton(
                    text: 'Create Account',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<RegisterCubit>(context)
                            .registerWithEmailPass(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      }
                    },
                  ),
                  fallback: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
            const SizedBox(height: 15),
            const OrWidget(),
            const SizedBox(height: 15),
            const AuthWithGoogle(
              text: 'Sign up with google',
            ),
            const SizedBox(height: 10),
            HaveAccount(
              onPressed: () {
                GoRouter.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}

class HaveAccount extends StatelessWidget {
  const HaveAccount({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Have an account? ",
          style: TextStyle(fontSize: 18),
        ),
        TextButton(
          style: const ButtonStyle(
              padding: WidgetStatePropertyAll(EdgeInsets.zero)),
          onPressed: onPressed,
          child: const Text(
            'Login',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
