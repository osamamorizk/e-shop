import 'package:flutter/material.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 0, right: 15),
            child: const Divider(
              color: Colors.black,
              thickness: .3,
            )),
      ),
      const Text(
        "OR",
        style: TextStyle(color: Colors.black, fontSize: 18),
      ),
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 15, right: 0),
            child: const Divider(
              color: Colors.black,
              thickness: .3,
            )),
      ),
    ]);
  }
}
