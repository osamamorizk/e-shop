import 'package:flutter/material.dart';

class EmailWidget extends StatelessWidget {
  const EmailWidget({
    super.key,
    this.state,
  });

  final state;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 90,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        // border: Border.all(width: .3),
      ),
      child: Center(
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                size: 32,
                Icons.account_circle,
              ),
            ),
            Text(
              "  ${state.email}",
              style: const TextStyle(fontSize: 24, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
