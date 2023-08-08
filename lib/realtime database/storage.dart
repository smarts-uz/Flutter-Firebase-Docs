import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

class StorageService {
  Future<void> uploadFile(
    Uint8List filePath,
    String fileName,
  ) async {
    try {
      await FirebaseStorage.instance.ref().child(fileName).putData(filePath);
    } catch (e) {
      print(e);
    }
  }

  Future<String> getDownloadURL(String fileName) async {
    try {
      return await FirebaseStorage.instance
          .ref()
          .child(fileName)
          .getDownloadURL();
    } catch (e) {
      return "";
    }
  }

  Future<void> deleteFile(String fileName) async {
    try {
      await FirebaseStorage.instance.ref().child(fileName).delete();
    } catch (e) {
      print(e);
    }
  }
}

class DowloadImageScreen extends StatelessWidget {
  const DowloadImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/codelab.png'),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                final firebaseStorageRef =
                    FirebaseStorage.instance.ref('assets/codelab.png');
                firebaseStorageRef.getData().then((data) {
                  final file = File('codelab.png');
                  file.writeAsBytes(data!);
                });
                print('Downloaded');
              },
              child: const Text('Download'),
            ),
          ],
        ),
      ),
    );
  }
}
