import 'dart:io';
import 'package:csv/csv.dart';

import 'package:path_provider/path_provider.dart';

class FileReader {
  // Future<List<List<dynamic>>> filereder() async {
  //   // اقرأ ملف CSV
  //   final String input = await rootBundle.loadString('lib/datebase/output.csv');

  //   // قم بتحويل البيانات إلى قائمة
  //   List<List<dynamic>> csvData = const CsvToListConverter().convert(input);

  //   // قم بطباعة البيانات للتأكد من قراءتها بشكل صحيح

  //   // يمكنك الآن تحويل البيانات إلى تنسيق Dart واستخدامها كما تريد
  //   return csvData;
  // }

  Future<void> writeToFile(List<dynamic> row) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/MyData.csv');

    List<List<dynamic>> csvData = await readFromNewFile();
    csvData.add(row);

    String csv = const ListToCsvConverter().convert(csvData);
    await file.writeAsString(csv);
  }

  Future<List<List<dynamic>>> readFromNewFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/MyData.csv');

    if (!await file.exists()) {
      await file.create(recursive: true);
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
      writeToFile(row);
    }
    if (await file.exists()) {
      String contents = await file.readAsString();

      List<List<dynamic>> csvData =
          const CsvToListConverter().convert(contents);
      return csvData;
    } else {
      throw const FileSystemException('File not found');
    }
  }

  Future<void> deleteRow(
      String firstColumnValue, String secondColumnValue) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/MyData.csv');

    List<List<dynamic>> csvData = await readFromNewFile();

    // Assume the columns we are checking are the first (index 0) and second (index 1)
    csvData.removeWhere(
        (row) => row[0] == firstColumnValue && row[1] == secondColumnValue);

    String csv = const ListToCsvConverter().convert(csvData);
    await file.writeAsString(csv);
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
}
