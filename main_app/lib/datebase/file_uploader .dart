import 'dart:io';

import 'package:UnutmaDostu/datebase/uploadstrategy.dart';

class FileUploader {
  late UploadStrategy _strategy;

  void setStrategy(UploadStrategy strategy) {
    _strategy = strategy;
  }

  Future<void> uploadFile(File file, String clientName) async {
    await _strategy.upload(file, clientName);
  }
}
