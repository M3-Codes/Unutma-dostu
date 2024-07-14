import 'dart:developer';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

import 'FileUploader.dart';
import 'ICsvManager.dart';
import 'UserManager.dart';

class CsvManager implements ICsvManager {
  Future<void> writeToFile(List<dynamic> row, String client) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$client.csv');
    List<List<dynamic>> csvData = await readFromNewFile(client);
    csvData.add(row);

    String csv = const ListToCsvConverter().convert(csvData);
    await file.writeAsString(csv);
    await FileUploader().uploadFileToFirebaseStorage(file, client);
    await FileUploader().uploadFolderToFirebaseStorage(client);
  }

  @override
  Future<List<List<dynamic>>> readFromNewFile(String client) async {
    final directory = await getApplicationDocumentsDirectory();
    final localFile = File('${directory.path}/$client.csv');

    if (!await localFile.exists()) {
      try {
        final storageRef =
            FirebaseStorage.instance.ref().child('$client/$client.csv');
        await storageRef.getDownloadURL();
        await storageRef.writeToFile(localFile);
        await FileUploader().downloadFolderFromFirebaseStorage(client);
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
            'Yer eki',
            'kodu'
          ];
          await writeToFile(row, client);
        } else {
          try {
            final storageRef =
                FirebaseStorage.instance.ref().child('$client/$client.csv');
            final metadata = await storageRef.getMetadata();
            final localFileStat = await localFile.stat();

            if (metadata.updated != null &&
                metadata.updated!.isAfter(localFileStat.modified)) {
              await storageRef.writeToFile(localFile);
              await FileUploader().downloadFolderFromFirebaseStorage(client);
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

  @override
  Future<void> deleteRow(String kodu, String oldPath1, String oldPath2,
      String newPath1, String newPath2, String client) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$client.csv');
    List<List<dynamic>> csvData = await readFromNewFile(client);

    csvData.removeWhere(
        (row) => row[9] == kodu && row[7] == oldPath1 && row[8] == oldPath2);
    String csv = const ListToCsvConverter().convert(csvData);
    await file.writeAsString(csv);
    await FileUploader().uploadFileToFirebaseStorage(file, client);

    if (oldPath1 != newPath1) {
      await FileUploader().deleteImage(client, oldPath1);
    }
    if (oldPath2 != newPath2) {
      await FileUploader().deleteImage(client, oldPath2);
    }
  }

  @override
  Future<List<bool>> isFull() async {
    List<List<dynamic>> csvData =
        await readFromNewFile(UserManager().clientName());
    List<bool> myList = List.filled(21, false);

    for (var i = 0; i < csvData.length - 1; i++) {
      myList[i] = true;
    }
    return myList;
  }

  @override
  Future<List<String>> tags() async {
    List<List<dynamic>> csvData =
        await readFromNewFile(UserManager().clientName());
    int listLength = csvData.length;
    List<String> list = List<String>.filled(listLength, "");

    for (var i = 1; i < listLength; i++) {
      list[i - 1] = csvData[i][3];
    }
    return list;
  }
}
