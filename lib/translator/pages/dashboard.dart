import 'package:flutter/material.dart';
import 'package:gtk_flutter/translator/pages/translator.dart';
import 'package:gtk_flutter/translator/widgets/custome_buttons.dart';

import 'flash_card.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Translate Text Extension")),
      body: Center(
          child: Column(children: [
        SizedBox(
          height: 30,
        ),
        Image.network('https://cdn-icons-png.flaticon.com/512/3898/3898150.png',
            height: 200, width: 200, fit: BoxFit.cover),
        SizedBox(
          height: 30,
        ),
        CustomeButton(
          titleText: "Flashcard",
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => FlashCard()));
          },
        ),
        SizedBox(
          height: 30,
        ),
        CustomeButton(
          titleText: "Translator",
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => Translator()));
          },
        ),
      ])),
    );
  }
}
