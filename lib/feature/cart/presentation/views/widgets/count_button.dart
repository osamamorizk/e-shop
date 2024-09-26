import 'package:flutter/material.dart';

class CountButton extends StatelessWidget {
  const CountButton({
    super.key,
    this.icon,
    this.onPressed,
  });
  final IconData? icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: .5)),
      child: Center(
        child: IconButton(
          padding: const EdgeInsets.all(0),
          onPressed: onPressed,
          icon: Icon(
            icon,
          ),
        ),
      ),
    );
  }
}
