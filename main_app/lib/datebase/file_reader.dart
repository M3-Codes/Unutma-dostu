import 'dart:io';
import 'package:csv/csv.dart';

class FileReader {
  List file() {
    // اقرأ ملف CSV
    final input = File('D:\output.csv').readAsStringSync();

    // قم بتحويل البيانات إلى قائمة
    List<List<dynamic>> csvData = const CsvToListConverter().convert(input);

    // قم بطباعة البيانات للتأكد من قراءتها بشكل صحيح

    // يمكنك الآن تحويل البيانات إلى تنسيق Dart واستخدامها كما تريد
    return csvData;
  }
}
