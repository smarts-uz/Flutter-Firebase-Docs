import 'package:flutter/material.dart';

class CustomeTile extends StatelessWidget {
  CustomeTile({required this.titleText, required this.subtitleText});
  final String titleText;
  final String subtitleText;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          titleText,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(subtitleText));
  }
}
