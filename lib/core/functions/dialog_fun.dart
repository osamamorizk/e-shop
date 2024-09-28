import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

void showAlertDialog(BuildContext context, void Function()? onPressed,
    String action, String warning) {
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
    child: Text(
      action,
      style: const TextStyle(color: Colors.red, fontSize: 18),
    ),
  );

  AlertDialog alert = AlertDialog(
    title: const Text(
      "Warning",
      style: TextStyle(fontSize: 26),
    ),
    content: Text(
      warning,
      style: const TextStyle(color: Colors.black, fontSize: 18),
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
