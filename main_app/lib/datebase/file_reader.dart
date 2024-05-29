import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class FileReader {
  Future<List<List<dynamic>>> filereder() async {
    // اقرأ ملف CSV
    final String input = await rootBundle.loadString('lib/datebase/output.csv');

    // قم بتحويل البيانات إلى قائمة
    List<List<dynamic>> csvData = const CsvToListConverter().convert(input);

    // قم بطباعة البيانات للتأكد من قراءتها بشكل صحيح

    // يمكنك الآن تحويل البيانات إلى تنسيق Dart واستخدامها كما تريد
    return csvData;
  }

  Future<void> writeToFile(List<dynamic> row) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/output.csv');

    if (!await file.exists()) {
      await file.create(recursive: true);
    }

    List<List<dynamic>> csvData = await filereder();
    csvData.add(row);

    String csv = const ListToCsvConverter().convert(csvData);
    await file.writeAsString(csv);
  }

  Future<List<List<dynamic>>> readFromNewFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/output.csv');

    if (await file.exists()) {
      String contents = await file.readAsString();
      List<List<dynamic>> csvData =
          const CsvToListConverter().convert(contents);
      return csvData;
    } else {
      throw FileSystemException('File not found');
    }
  }

  // ignore: non_constant_identifier_names
  List<bool> myList = List.filled(21, false);
  Future<List<bool>> doluMU() async {
    List<List<dynamic>> csvData = await filereder();
    for (var i = 0; i < csvData.length - 1; i++) {
      myList[i] = true;
    }
    return myList;
  }
}
