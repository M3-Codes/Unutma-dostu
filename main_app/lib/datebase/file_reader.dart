import 'dart:developer';
import 'dart:io';
import 'package:path/path.dart';
import 'package:csv/csv.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path_provider/path_provider.dart';

class FileReader {
  String clientName() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.email!;
    } else {
      log("User not found!!!!");
    }
    return "MyDate";
  }

  Future<void> writeToFile(List<dynamic> row) async {
    String clinet = clientName();
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$clinet.csv');

    List<List<dynamic>> csvData = await readFromNewFile();
    csvData.add(row);

    String csv = const ListToCsvConverter().convert(csvData);
    await file.writeAsString(csv);
    await uploadFileToFirebaseStorage(file, clinet);
    await uploadFolderToFirebaseStorage(clinet);
  }

  Future<List<List<dynamic>>> readFromNewFile() async {
    String? clinet = clientName();
    final directory = await getApplicationDocumentsDirectory();
    final localFile = File('${directory.path}/$clinet.csv');

    if (!await localFile.exists()) {
      // Check if the file exists in Firebase Storage
      try {
        final storageRef =
            FirebaseStorage.instance.ref().child('$clinet/$clinet.csv');
        await storageRef.getDownloadURL();
        await storageRef.writeToFile(localFile);
        await downloadFolderFromFirebaseStorage(clinet);
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
        }
      }
    } else {
      try {
        final storageRef =
            FirebaseStorage.instance.ref().child('$clinet/$clinet.csv');
        final metadata = await storageRef.getMetadata();
        final localFileStat = await localFile.stat();

        if (metadata.updated != null &&
            metadata.updated!.isAfter(localFileStat.modified)) {
          await storageRef.writeToFile(localFile);
          await downloadFolderFromFirebaseStorage(clinet);
          log('File updated from Firebase Storage.');
        }
      } catch (e) {
        log('Error checking for updates: $e');
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
    String? clinet = clientName();
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$clinet.csv');

    List<List<dynamic>> csvData = await readFromNewFile();

    // Assume the columns we are checking are the first (index 0) and second (index 1)
    csvData.removeWhere((row) =>
        row[0] == firstColumnValue &&
        row[1] == secondColumnValue &&
        row[7] == oldPath1 &&
        row[8] == oldPath2);

    String csv = const ListToCsvConverter().convert(csvData);
    await file.writeAsString(csv);
    await uploadFileToFirebaseStorage(file, clinet);

    // Delete images if paths are not the same
    if (oldPath1 != newPath1) {
      await deleteImage(clinet, oldPath1);
    }
    if (oldPath2 != newPath2) {
      await deleteImage(clinet, oldPath2);
    }
  }

  // ignore: non_constant_identifier_names
  List<bool> myList = List.filled(21, false);
  Future<List<bool>> doluMU() async {
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

  Future<void> uploadFileToFirebaseStorage(File file, String clientName) async {
    final Reference storageRef = FirebaseStorage.instance
        .ref()
        .child('$clientName/${basename(file.path)}');
    await storageRef.putFile(file);
  }

  // Create folder for client in Firebase Storage
  Future<void> createClientFolderInFirebaseStorage(String clientName) async {
    final Reference storageRef =
        FirebaseStorage.instance.ref().child('$clientName/');
    await storageRef
        .child('placeholder.txt')
        .putString('This is a placeholder file');
  }

  Future<void> uploadFolderToFirebaseStorage(String client) async {
    final appDir = await getApplicationDocumentsDirectory();
    const folderName = 'my_image';
    final directory = Directory('${appDir.path}/$folderName');

    if (await directory.exists()) {
      final List<FileSystemEntity> files = directory.listSync();

      for (FileSystemEntity entity in files) {
        if (entity is File) {
          final storageRef = FirebaseStorage.instance
              .ref()
              .child('$client/$folderName/${basename(entity.path)}');
          await storageRef.putFile(entity);
          log('Uploaded: ${entity.path}');
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

      for (var item in result.items) {
        final String fileName = item.name;
        final File localFile = File('${directory.path}/$fileName');

        if (!await localFile.exists()) {
          await item.writeToFile(localFile);
          log('Downloaded: ${localFile.path}');
        }
      }
    } catch (e) {
      log('Error downloading folder: $e');
    }
  }

  Future<void> deleteImage(String client, String path) async {
    final appDir = await getApplicationDocumentsDirectory();
    const folderName = 'my_image';
    final directory = Directory('${appDir.path}/$folderName');

    // Delete local file
    final localFile = File('${directory.path}/$path');
    if (await localFile.exists()) {
      await localFile.delete();
      log('Deleted local file: ${localFile.path}');
    } else {
      log('Local file not found: ${localFile.path}');
    }

    // Delete file from Firebase Storage
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
