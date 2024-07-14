import 'dart:io';

abstract class IFileUploader {
  Future<void> uploadFileToFirebaseStorage(File file, String clientName,
      {bool skipQueue = false});
  Future<void> uploadFolderToFirebaseStorage(String client);
  Future<void> downloadFolderFromFirebaseStorage(String client);
  Future<void> deleteImage(String client, String path);
}
