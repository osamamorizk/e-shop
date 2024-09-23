import 'package:flutter/material.dart';
import 'package:shop_app/core/helpers/styles.dart';
import 'package:shop_app/core/widgets/custom_button.dart';
import 'package:shop_app/feature/login/presentation/views/widgets/custom_text_form.dart';
import 'package:shop_app/feature/login/presentation/views/widgets/dont_have_account.dart';
import 'package:shop_app/feature/login/presentation/views/widgets/login_with_google.dart';
import 'package:shop_app/feature/login/presentation/views/widgets/or_widget.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
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
          const CustomTextField(
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
            hintText: 'Enter your Password',
            suffixIcon: Icon(
              Icons.visibility,
              color: Colors.grey[400],
            ),
          ),
          const SizedBox(height: 30),
          const CustomButton(text: 'Login'),
          const SizedBox(height: 15),
          const OrWidget(),
          const SizedBox(height: 15),
          const LoginWithGoogle(),
          const SizedBox(height: 15),
          const DontHaveAccount(),
        ],
      ),
    );
  }
}
