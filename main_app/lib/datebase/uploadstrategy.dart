import 'dart:io';

abstract class UploadStrategy {
  Future<void> upload(File file, String clientName);
}
