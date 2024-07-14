import 'dart:io';

import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';

import 'file_uploader.dart';

class CsvFileHandler {
  final FileUploader fileUploader;

  CsvFileHandler(this.fileUploader);

  Future<void> writeToFile(List<dynamic> row) async {
    String client = fileUploader.clientName();
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$client.csv');

    List<List<dynamic>> csvData = await readFromNewFile();
    csvData.add(row);

    String csv = const ListToCsvConverter().convert(csvData);
    await file.writeAsString(csv);

    await fileUploader.uploadFile(file, client);
  }

  Future<List<List<dynamic>>> readFromNewFile() async {
    String client = fileUploader.clientName();
    final directory = await getApplicationDocumentsDirectory();
    final localFile = File('${directory.path}/$client.csv');

    if (!await localFile.exists()) {
      try {
        await fileUploader.storageClient
            .downloadFile('$client/$client.csv', localFile);
      } catch (e) {
        await localFile.create(recursive: true);
        List<dynamic> headerRow = [
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
        await writeToFile(headerRow);
      }
    }

    String contents = await localFile.readAsString();
    return const CsvToListConverter().convert(contents);
  }

  Future<void> deleteRow(dynamic firstColumnValue, dynamic secondColumnValue,
      String oldPath1, String oldPath2) async {
    String client = fileUploader.clientName();
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
    await fileUploader.uploadFile(file, client);

    await fileUploader.storageClient.deleteFile('$client/$oldPath1');
    await fileUploader.storageClient.deleteFile('$client/$oldPath2');
  }
}
