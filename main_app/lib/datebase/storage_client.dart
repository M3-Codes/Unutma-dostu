import 'dart:io';

abstract class StorageClient {
  Future<void> uploadFile(File file, String path);
  Future<void> downloadFile(String path, File file);
  Future<void> deleteFile(String path);
}
