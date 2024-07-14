import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

import 'uploadstrategy.dart';

class ImmediateUploadStrategy implements UploadStrategy {
  @override
  Future<void> upload(File file, String clientName) async {
    final Reference storageRef = FirebaseStorage.instance
        .ref()
        .child('$clientName/${basename(file.path)}');
    await storageRef.putFile(file);
  }
}
