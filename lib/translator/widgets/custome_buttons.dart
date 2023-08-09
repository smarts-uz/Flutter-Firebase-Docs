import 'package:flutter/material.dart';

class CustomeButton extends StatelessWidget {
  CustomeButton({
    required this.titleText,
    required this.onPressed,
  });
  final String titleText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 300,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: TextButton(
          onPressed: onPressed,
          child: Text(
            titleText,
            style: Theme.of(context).textTheme.titleMedium,
          )),
    );
  }
}
