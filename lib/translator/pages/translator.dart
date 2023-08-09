import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gtk_flutter/translator/widgets/custome_tile.dart';
import '../model/translator.dart';

class Translator extends StatefulWidget {
  const Translator({super.key});

  @override
  State<Translator> createState() => _TranslatorState();
}

class _TranslatorState extends State<Translator> {
  final ref = FirebaseFirestore.instance
      .collection('test')
      .doc('RlzUfb7W2m8TY3xpi3J5')
      .withConverter<TranslatorModel>(
        fromFirestore: (snapshot, _) => TranslatorModel.fromJson(
          snapshot.data()!,
        ),
        toFirestore: (model, _) => model.toJson(),
      );

  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Text Translator")),
      body: StreamBuilder<DocumentSnapshot<TranslatorModel>?>(
        stream: ref.snapshots(),
        builder: (context, snapshot) {
          final snapshotData = snapshot.data;
          if (snapshotData != null) {
            // Convert the snapshot to a map.
            final TranslatorModel? translatedData = snapshotData.data();
            if (translatedData == null) {
              return Center(child: Text('No Data'));
            }
            return Column(
              children: [
                CustomeTile(
                  titleText: translatedData.input ?? 'No Input',
                  subtitleText: 'English',
                ),
                Divider(),
                CustomeTile(
                  titleText: translatedData.translated?.de ?? 'No De',
                  subtitleText: 'German',
                ),
                CustomeTile(
                  titleText: translatedData.translated?.es ?? 'No Es',
                  subtitleText: 'Spanish',
                ),
                CustomeTile(
                  titleText: translatedData.translated?.fr ?? 'No Fr',
                  subtitleText: 'French',
                ),
                CustomeTile(
                  titleText: translatedData.translated?.it ?? 'No It',
                  subtitleText: 'Italian',
                ),
                SizedBox(
                  height: 30,
                ),
                Image.network(
                    'https://cdn-icons-png.flaticon.com/512/576/576515.png',
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    height: 50,
                    width: 400,
                    decoration: BoxDecoration(
                      color: Colors.blue[300],
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                      controller: _textController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Input text',
                        contentPadding: EdgeInsets.only(top: 15, left: 10),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.send, color: Colors.blue),
                          onPressed: () async {
                            // Update the input field on the translation document.
                            await ref.update(
                              {'input': _textController.text},
                            );

                            // Clear the text field to prepare for next input.
                            _textController.clear();
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
