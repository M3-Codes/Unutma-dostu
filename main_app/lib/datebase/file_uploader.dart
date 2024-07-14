import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart';
import 'connectivity_checker .dart';
import 'storage_client.dart';

class FileUploader {
  final StorageClient storageClient;
  final ConnectivityChecker connectivityChecker;
  final List<String> _uploadQueue = [];
  Timer? _connectivityTimer;

  FileUploader(this.storageClient, this.connectivityChecker);

  Future<void> uploadFile(File file, String clientName,
      {bool skipQueue = false}) async {
    final path = '$clientName/${basename(file.path)}';
    if (await connectivityChecker.isConnected() || skipQueue) {
      await storageClient.uploadFile(file, path);
    } else {
      log('No internet connection. File not uploaded.');
      _uploadQueue.add(file.path);
      _startConnectivityCheck();
    }
  }

  void _startConnectivityCheck() {
    _connectivityTimer?.cancel();
    _connectivityTimer =
        Timer.periodic(const Duration(seconds: 10), (timer) async {
      if (await connectivityChecker.isConnected()) {
        await _processUploadQueue();
      }
    });
  }

  Future<void> _processUploadQueue() async {
    while (_uploadQueue.isNotEmpty) {
      String filePath = _uploadQueue.removeAt(0);
      File file = File(filePath);
      String client = clientName();
      await uploadFile(file, client, skipQueue: true);
    }
  }

  String clientName() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.email!;
    } else {
      log("User not found!!!!");
    }
    return "MyDate";
  }
}
