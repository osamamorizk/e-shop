import 'package:flutter/material.dart';

class OrderInfo extends StatelessWidget {
  const OrderInfo({
    super.key,
    required this.title,
    required this.info,
  });
  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        title,
        style: const TextStyle(fontSize: 22),
      ),
      trailing: Text(
        info,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
