import 'dart:developer';
import 'dart:io';

import 'package:UnutmaDostu/datebase/immediate_upload_strategy.dart';
import 'package:UnutmaDostu/datebase/uploadstrategy.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'connectivity_checker .dart';

class QueuedUploadStrategy implements UploadStrategy {
  final List<String> _uploadQueue = [];
  // final ConnectivityChecker connectivityChecker = ConnectivityChecker();

  // @override
  // Future<void> upload(File file, String clientName) async {
  //   if (await connectivityChecker.isConnectedToInternet()) {
  //     final Reference storageRef = FirebaseStorage.instance.ref().child('$clientName/${basename(file.path)}');
  //     await storageRef.putFile(file);
  //   } else {
  //     log('No internet connection. File not uploaded.');
  //     _uploadQueue.add(file.path);
  //     connectivityChecker.startConnectivityCheck(_processUploadQueue);
  //   }
  // }

  Future<void> _processUploadQueue() async {
    while (_uploadQueue.isNotEmpty) {
      String filePath = _uploadQueue.removeAt(0);
      File file = File(filePath);
      String client = clientName();
      await ImmediateUploadStrategy().upload(file, client);
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

  @override
  Future<void> upload(File file, String clientName) {
    // TODO: implement upload
    throw UnimplementedError();
  }
}
