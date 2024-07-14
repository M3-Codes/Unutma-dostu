import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'ConnectivityChecker.dart';
import 'IFileUploader.dart';

class FileUploader implements IFileUploader {
  @override
  Future<void> uploadFileToFirebaseStorage(File file, String clientName,
      {bool skipQueue = false}) async {
    if (await Connectivitychecker().isConnectedToInternet() || skipQueue) {
      final Reference storageRef = FirebaseStorage.instance
          .ref()
          .child('$clientName/${basename(file.path)}');
      await storageRef.putFile(file);
    } else {
      log('No internet connection. File not uploaded.');
    }
  }

  @override
  Future<void> uploadFolderToFirebaseStorage(String client) async {
    final appDir = await getApplicationDocumentsDirectory();
    const folderName = 'my_image';
    final directory = Directory('${appDir.path}/$folderName');

    if (await directory.exists()) {
      final List<File> localFiles =
          directory.listSync().whereType<File>().toList();
      final ListResult firebaseFiles =
          await FirebaseStorage.instance.ref('$client/$folderName').listAll();
      final Set<String> firebaseFileNames =
          firebaseFiles.items.map((item) => item.name).toSet();

      for (File localFile in localFiles) {
        final String fileName = basename(localFile.path);

        if (!firebaseFileNames.contains(fileName)) {
          final storageRef = FirebaseStorage.instance
              .ref()
              .child('$client/$folderName/$fileName');
          await storageRef.putFile(localFile);
          log('Uploaded: ${localFile.path}');
        } else {
          log('File already exists in Firebase Storage: $fileName');
        }
      }
    } else {
      log('Directory $folderName does not exist.');
    }
  }

  @override
  Future<void> downloadFolderFromFirebaseStorage(String client) async {
    final appDir = await getApplicationDocumentsDirectory();
    const folderName = 'my_image';
    final directory = Directory('${appDir.path}/$folderName');

    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }

    try {
      final ListResult result =
          await FirebaseStorage.instance.ref('$client/$folderName').listAll();
      final List<File> localFiles =
          directory.listSync().whereType<File>().toList();
      final Set<String> localFileNames =
          localFiles.map((file) => basename(file.path)).toSet();

      for (var item in result.items) {
        final String fileName = item.name;
        final File localFile = File('${directory.path}/$fileName');

        if (!localFileNames.contains(fileName) || !(await localFile.exists())) {
          await item.writeToFile(localFile);
          log('Downloaded: ${localFile.path}');
        } else {
          log('File already exists locally: ${localFile.path}');
        }
      }
    } catch (e) {
      log('Error downloading folder: $e');
    }
  }

  @override
  Future<void> deleteImage(String client, String path) async {
    final appDir = await getApplicationDocumentsDirectory();
    const folderName = 'my_image';
    final directory = Directory('${appDir.path}/$folderName');
    final localFile = File('${directory.path}/$path');

    if (await localFile.exists()) {
      await localFile.delete();
      log('Deleted local file: ${localFile.path}');
    } else {
      log('Local file not found: ${localFile.path}');
    }

    try {
      final storageRef =
          FirebaseStorage.instance.ref().child('$client/$folderName/$path');
      await storageRef.delete();
      log('Deleted file from Firebase Storage: $path');
    } catch (e) {
      log('Error deleting file from Firebase Storage: $e');
    }
  }
}
