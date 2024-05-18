import 'package:flutter/material.dart';
import '../datebase/file_reader.dart';
import '../design/view/Imagesbutton.dart';
import '../design/view/againtime.dart';
import '../design/view/daydate.dart';
import '../design/view/labelcolor.dart';
import '../design/view/readingboxes.dart';
import '../design/view/view_addbar.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  late List database = [];
  late List<String> time;
  late List<String> tarih;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    FileReader reader = FileReader();
    database = await reader.file();
    setState(() {
      time = database[1][5].toString().split(':');
      tarih = database[1][6].toString().split('/');
    });
  }

  @override
  Widget build(BuildContext context) {
    if (database.isEmpty || time.isEmpty || tarih.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              addbar(title: database[1][0].toString()),
              Masafe_H(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Imagesbutton(text: 'Ürün eki', path: database[1][7]),
                  const SizedBox(width: 25),
                  Imagesbutton(text: 'Yer eki', path: database[1][8]),
                ],
              ),
              Masafe_H(),
              const SizedBox(width: 10),
              readingboxes(hintText: database[1][0], title: 'Ürün Adı'),
              readingboxes(hintText: database[1][1], title: 'Açıklama'),
              readingboxes(hintText: database[1][2], title: 'Yer'),
              labelColor(
                  color: getColorFromString(database[1][4]),
                  text: database[1][3]),
              AgainTime(minute: time[0], hour: time[1], second: time[2]),
              DayDate(month: tarih[0], day: tarih[1], year: tarih[2]),
            ],
          ),
          Positioned(
            bottom: 25,
            child: Image.asset(
              "images/yslogo.png",
              width: 390,
              height: 65,
            ),
          ),
        ],
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
