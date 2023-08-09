import 'package:flutter/material.dart';

class FlashCardTile extends StatelessWidget {
  FlashCardTile(
      {required this.titleText,
      required this.subtitleText,
      required this.bgcolor});
  final String titleText;
  final String subtitleText;
  final Color bgcolor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: bgcolor,
        ),
        child: ListTile(
          title: Text(
            titleText,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: Text(subtitleText),
        ),
      ),
    );
  }
}
