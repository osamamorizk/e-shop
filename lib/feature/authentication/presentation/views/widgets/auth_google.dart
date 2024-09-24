import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthWithGoogle extends StatelessWidget {
  const AuthWithGoogle({super.key, this.onTap, required this.text});
  final void Function()? onTap;
  final String text;
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(
              width: 20,
            ),
            const Icon(
              FontAwesomeIcons.google,
              color: Colors.pink,
            )
          ],
        ),
      ),
    );
  }
}
