import 'dart:io';

import 'package:UnutmaDostu/datebase/FileUploaderFactory%20.dart';
import 'package:UnutmaDostu/datebase/immediate_upload_strategy.dart';
import 'package:UnutmaDostu/datebase/queued_upload_strategy%20.dart';
import 'package:UnutmaDostu/datebase/uploadstrategy.dart';
import 'package:csv/csv.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class FileManager {
  Future<void> writeToFile(List<dynamic> row) async {
    String client = clientName();
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$client.csv');

    List<List<dynamic>> csvData = await readFromNewFile();
    csvData.add(row);

    String csv = const ListToCsvConverter().convert(csvData);
    await file.writeAsString(csv);

    final fileUploader = FileUploaderFactory.createFileUploader();
    fileUploader.setStrategy(QueuedUploadStrategy() as UploadStrategy);
    await fileUploader.uploadFile(file, client);
    await uploadFolderToFirebaseStorage(client);

    log('No internet connection. Changes saved locally.');
  }

  Future<List<List<dynamic>>> readFromNewFile() async {
    String client = clientName();
    final directory = await getApplicationDocumentsDirectory();
    final localFile = File('${directory.path}/$client.csv');

    if (!await localFile.exists()) {
      try {
        final storageRef =
            FirebaseStorage.instance.ref().child('$client/$client.csv');
        await storageRef.getDownloadURL();
        await storageRef.writeToFile(localFile);
        await downloadFolderFromFirebaseStorage(client);
        await Future.delayed(const Duration(seconds: 3));
      } catch (e) {
        if (!await localFile.exists()) {
          await localFile.create(recursive: true);
          List<dynamic> row = [
            'Ürün adı',
            'Açıklama',
            'Yer',
            'Etiket',
            'Renk',
            'Tekrar',
            'Tarih',
            'ürün eki',
            'Yer eki'
          ];
          await writeToFile(row);
        } else {
          try {
            final storageRef =
                FirebaseStorage.instance.ref().child('$client/$client.csv');
            final metadata = await storageRef.getMetadata();
            final localFileStat = await localFile.stat();

            if (metadata.updated != null &&
                metadata.updated!.isAfter(localFileStat.modified)) {
              await storageRef.writeToFile(localFile);
              await downloadFolderFromFirebaseStorage(client);
              log('File updated from Firebase Storage.');
            }
          } catch (e) {
            log('Error checking for updates: $e');
          }
        }
      }
    }

    if (await localFile.exists()) {
      String contents = await localFile.readAsString();
      List<List<dynamic>> csvData =
          const CsvToListConverter().convert(contents);
      return csvData;
    } else {
      throw const FileSystemException('File not found');
    }
  }

  Future<void> deleteRow(
      dynamic firstColumnValue,
      dynamic secondColumnValue,
      String oldPath1,
      String oldPath2,
      String newPath1,
      String newPath2) async {
    String? client = clientName();
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$client.csv');

    List<List<dynamic>> csvData = await readFromNewFile();

    csvData.removeWhere((row) =>
        row[0] == firstColumnValue &&
        row[1] == secondColumnValue &&
        row[7] == oldPath1 &&
        row[8] == oldPath2);

    String csv = const ListToCsvConverter().convert(csvData);
    await file.writeAsString(csv);
    final fileUploader = FileUploaderFactory.createFileUploader();
    fileUploader.setStrategy(ImmediateUploadStrategy());
    await fileUploader.uploadFile(file, client);

    if (oldPath1 != newPath1) {
      await deleteImage(client, oldPath1);
    }
    if (oldPath2 != newPath2) {
      await deleteImage(client, oldPath2);
    }
  }

  Future<List<bool>> doluMU() async {
    List<bool> myList = List.filled(21, false);
    List<List<dynamic>> csvData = await readFromNewFile();
    for (var i = 0; i < csvData.length - 1; i++) {
      myList[i] = true;
    }
    return myList;
  }

  Future<List<String>> etiktler() async {
    List<List<dynamic>> csvData = await readFromNewFile();
    int listlength = csvData.length;
    List<String> list = List<String>.filled(listlength, "");

    for (var i = 1; i < listlength; i++) {
      list[i - 1] = csvData[i][3];
    }
    return list;
  }

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

  Future<void> deleteImage(String client, String imagePath) async {
    try {
      final Reference storageRef =
          FirebaseStorage.instance.ref().child('$client/my_image/$imagePath');
      await storageRef.delete();
      log('Deleted image from Firebase Storage: $imagePath');
    } catch (e) {
      log('Error deleting image: $e');
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

  void log(String message) {
    print(message);
  }
}
