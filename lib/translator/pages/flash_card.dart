import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gtk_flutter/translator/colors.dart';
import 'package:gtk_flutter/translator/widgets/fleshcard_tile.dart';
import '../model/translator.dart';

class FlashCard extends StatefulWidget {
  const FlashCard({super.key});

  @override
  State<FlashCard> createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> {
  final ref = FirebaseFirestore.instance.collection('translations');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Multilingual Flash Card")),
      body: StreamBuilder(
        stream: ref.snapshots(),
        builder: (context, snapshot) {
          final snapshotData = snapshot.data;
          if (snapshotData != null) {
            List<TranslatorModel> categoryList = snapshot.data!.docs
                .map((e) => TranslatorModel.fromJson(e.data()))
                .toList();
            return PageView.builder(
                allowImplicitScrolling: true,
                itemCount: categoryList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue[200],
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      width: double.infinity,
                      height: double.infinity,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                                categoryList[index].image ??
                                    'https://cdn-icons-png.flaticon.com/512/1829/1829586.png',
                                height: 200,
                                width: 200),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            categoryList[index].input ?? 'no Input Data',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FlashCardTile(
                            titleText: categoryList[index].translated?.es ??
                                'no Translated Data',
                            subtitleText: 'Spanish',
                            bgcolor: MyColor.myRed,
                          ),
                          FlashCardTile(
                            titleText: categoryList[index].translated?.fr ??
                                'no Translated Data',
                            subtitleText: 'french',
                            bgcolor: MyColor.myBlue,
                          ),
                          FlashCardTile(
                              titleText: categoryList[index].translated?.de ??
                                  'no Translated Data',
                              subtitleText: 'German',
                              bgcolor: MyColor.myGreen),
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
