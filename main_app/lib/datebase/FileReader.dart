// ignore_for_file: unused_element

import 'dart:async';
import 'dart:io';

import 'iconnectivity_checker.dart';
import 'icsv_manager.dart';
import 'ifile_uploader.dart';
import 'iuser_manager.dart';

class FileReader {
  final List<String> _uploadQueue = [];
  Timer? _connectivityTimer;

  final IFileUploader fileUploader;
  final IConnectivityChecker connectivityChecker;
  final IUserManager userManager;
  final ICsvManager csvManager;

  FileReader(this.fileUploader, this.connectivityChecker, this.userManager,
      this.csvManager);

  void _startConnectivityCheck() {
    _connectivityTimer?.cancel();
    _connectivityTimer =
        Timer.periodic(const Duration(seconds: 10), (timer) async {
      if (await connectivityChecker.isConnectedToInternet()) {
        await _processUploadQueue();
      }
    });
  }

  Future<void> _processUploadQueue() async {
    while (_uploadQueue.isNotEmpty) {
      String filePath = _uploadQueue.removeAt(0);
      File file = File(filePath);
      String client = userManager.clientName();
      await fileUploader.uploadFileToFirebaseStorage(file, client,
          skipQueue: true);
    }
  }

  Future<void> writeToFile(List<dynamic> row) async {
    String client = userManager.clientName();
    await csvManager.writeToFile(row, client);
    await fileUploader.uploadFolderToFirebaseStorage(client);
  }

  Future<List<List<dynamic>>> readFromNewFile() async {
    String client = userManager.clientName();
    return await csvManager.readFromNewFile(client);
  }

  Future<void> deleteRow(String kodu, String oldPath1, String oldPath2,
      String newPath1, String newPath2) async {
    String client = userManager.clientName();
    await csvManager.deleteRow(
        kodu, oldPath1, oldPath2, newPath1, newPath2, client);
    await fileUploader.deleteImage(client, oldPath1);
    await fileUploader.deleteImage(client, oldPath2);
  }

  Future<List<bool>> isFull() async {
    return await csvManager.isFull();
  }

  Future<List<String>> tags() async {
    return await csvManager.tags();
  }
}
