import 'dart:io';

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

  Future<void> writeToFile(List<dynamic> row) async {
    // احصل على الدليل المؤقت

    // حدد موقع الملف
    const path = 'lib/datebase/output.csv';
    final file = File(path);

    // تأكد من وجود الملف
    if (!await file.exists()) {
      await file.create(recursive: true);
    }

    // اقرأ محتويات الملف الحالية
    String contents = await file.readAsString();

    // إضافة السطر الجديد إلى المحتويات
    List<List<dynamic>> csvData = const CsvToListConverter().convert(contents);
    csvData.add(row);

    // تحويل البيانات إلى تنسيق CSV
    String csv = const ListToCsvConverter().convert(csvData);

    // كتابة البيانات إلى الملف
    await file.writeAsString(csv);
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
