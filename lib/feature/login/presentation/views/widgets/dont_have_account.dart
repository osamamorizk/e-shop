import 'package:flutter/material.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account? ",
          style: TextStyle(fontSize: 18),
        ),
        TextButton(
          style: const ButtonStyle(
              padding: WidgetStatePropertyAll(EdgeInsets.zero)),
          onPressed: () {},
          child: const Text(
            'Signup',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
