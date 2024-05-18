import 'package:flutter/material.dart';
import 'package:view_page/design/Imagesbutton.dart';
import 'package:view_page/design/addbar.dart';
import 'package:view_page/design/againtime.dart';
import 'package:view_page/design/daydate.dart';
import 'package:view_page/design/labelcolor.dart';
import 'package:view_page/design/readingboxes.dart';

import 'datebase/file_reader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FileReader reader = FileReader();
  database = await reader.file();
  runApp(const MyApp());
}

List database = [];

List<String> time = database[1][5].toString().split(':');
List<String> tarih = database[1][6].toString().split('/');

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(children: [
          Column(
            children: [
              addbar(
                title: database[1][0].toString(),
              ),
              Masafe_H(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Imagesbutton(
                    text: 'Ürün eki',
                    path: database[1][7],
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Imagesbutton(
                    text: 'Yer eki',
                    path: database[1][8],
                  )
                ],
              ),
              Masafe_H(),
              const SizedBox(
                width: 10,
              ),
              readingboxes(
                hintText: database[1][0],
                title: 'Ürün Adı',
              ),
              readingboxes(
                hintText: database[1][1],
                title: 'Açıklama',
              ),
              readingboxes(
                hintText: database[1][2],
                title: 'Yer           ',
              ),
              labelColor(
                color: getColorFromString(database[1][4]),
                text: database[1][3],
              ),

              AgainTime(
                minute: time[0],
                hour: time[1],
                second: time[2],
              ),
              DayDate(
                month: tarih[0],
                day: tarih[1],
                year: tarih[2],
              ),
              //Masafe_H(),
            ],
          ),
          Positioned(
              bottom: 25,
              child: Image.asset(
                "images/m3code.jpg",
                width: 390,
                height: 65,
              ))
        ]),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget Masafe_H() {
  return const SizedBox(
    height: 25,
  );
}

Color getColorFromString(String colorString) {
  // قائمة بمطابقة الألوان بالنص مع القيم RGB
  final Map<String, Color> colors = {
    'red': Colors.red,
    'green': Colors.green,
    'blue': Colors.blue,
    'yellow': Colors.yellow,
    'black': Colors.black,
    'cyan': Colors.cyan,
    // يمكنك إضافة المزيد من الألوان هنا
  };

  // التحقق مما إذا كانت الألوان متاحة في القائمة
  if (colors.containsKey(colorString)) {
    return colors[colorString]!;
  } else {
    // إذا لم تكن اللون متاحًا، يمكنك إرجاع قيمة لون افتراضية هنا أو رمي استثناء
    throw Exception('اللون $colorString غير مدعوم');
  }
}
