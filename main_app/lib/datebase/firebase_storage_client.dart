import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'storage_client.dart';

class FirebaseStorageClient implements StorageClient {
  @override
  Future<void> uploadFile(File file, String path) async {
    final Reference storageRef = FirebaseStorage.instance.ref().child(path);
    await storageRef.putFile(file);
  }

  @override
  Future<void> downloadFile(String path, File file) async {
    final Reference storageRef = FirebaseStorage.instance.ref().child(path);
    await storageRef.writeToFile(file);
  }

  @override
  Future<void> deleteFile(String path) async {
    final Reference storageRef = FirebaseStorage.instance.ref().child(path);
    await storageRef.delete();
  }
}
