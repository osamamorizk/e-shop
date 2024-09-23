import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginWithGoogle extends StatelessWidget {
  const LoginWithGoogle({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(width: .2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login with google',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              FontAwesomeIcons.google,
              color: Colors.pink,
            )
          ],
        ),
      ),
    );
  }
}
