import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

void showAlertDialog(BuildContext context, void Function()? onPressed) {
  Widget cancelButton = TextButton(
    child: const Text(
      "Cancel",
      style: TextStyle(color: Colors.blue, fontSize: 18),
    ),
    onPressed: () {
      GoRouter.of(context).pop();
    },
  );
  Widget continueButton = TextButton(
    onPressed: onPressed,
    child: const Text(
      "Delete",
      style: TextStyle(color: Colors.red, fontSize: 18),
    ),
  );

  AlertDialog alert = AlertDialog(
    title: const Text(
      "Warning",
      style: TextStyle(fontSize: 30),
    ),
    content: const Text(
      "Would you like to delete product?",
      style: TextStyle(color: Colors.black, fontSize: 18),
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
