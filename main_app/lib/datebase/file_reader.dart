import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

class FileReader {
  Future<List<List<dynamic>>> file() async {
    // اقرأ ملف CSV
    final String input = await rootBundle.loadString('lib/datebase/output.csv');

    // قم بتحويل البيانات إلى قائمة
    List<List<dynamic>> csvData = const CsvToListConverter().convert(input);

    // قم بطباعة البيانات للتأكد من قراءتها بشكل صحيح

    // يمكنك الآن تحويل البيانات إلى تنسيق Dart واستخدامها كما تريد
    return csvData;
  }

  // ignore: non_constant_identifier_names
  List<bool> myList = List.filled(21, false);
  Future<List<bool>> doluMU() async {
    List<List<dynamic>> csvData = await file();

    for (var i = 0; i < csvData.length - 1; i++) {
      myList[i] = true;
    }
    return myList;
  }
}
