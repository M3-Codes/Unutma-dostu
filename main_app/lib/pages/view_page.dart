import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../datebase/file_reader.dart';
import '../design/view/Imagesbutton.dart';
import '../design/view/againtime.dart';
import '../design/view/daydate.dart';
import '../design/view/labelcolor.dart';
import '../design/view/readingboxes.dart';
import '../design/view/view_addbar.dart';

class ViewPage extends StatefulWidget {
  final int index;
  const ViewPage({required this.index, super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  late List database = [];
  late List<String> time;
  late List<String> tarih;
  bool _loading = false;
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  FileReader reader = FileReader();
  Future<void> _loadData() async {
    setState(() {
      _loading = true;
    });

    database = await reader.readFromNewFile();
    setState(() {
      time = database[widget.index][5].toString().split(':');
      tarih = database[widget.index][6].toString().split('/');
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (database.isEmpty || time.isEmpty || tarih.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return ModalProgressHUD(
      inAsyncCall: _loading,
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Addbar(
                  title: database[widget.index][0].toString(),
                  onpressed: () {
                    reader.deleteRow(database[widget.index][0].toString(),
                        database[widget.index][1].toString());
                  },
                ),
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
                readingboxes(
                    hintText: database[widget.index][0], title: 'Ürün Adı '),
                readingboxes(
                    hintText: database[widget.index][1], title: 'Açıklama'),
                readingboxes(
                    hintText: database[widget.index][2],
                    title: 'Yer           '),
                labelColor(
                    color: Color(database[widget.index][4]),
                    text: database[widget.index][3]),
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

// Color getColorFromString(String colorString) {
//   // قائمة بمطابقة الألوان بالنص مع القيم RGB
//   final Map<String, Color> colors = {
//     'Color(0xfff44336)': const Color(0xfff44336),
//     'Color(0xffe91e63)': const Color(0xffe91e63),
//     'Color(0xff9c27b0)': const Color(0xff9c27b0),
//     'Color(0xff673ab7)': const Color(0xff673ab7),
//     'Color(0xff3f51b5)': const Color(0xff3f51b5),
//     'Color(0xff2196f3)': const Color(0xff2196f3),
//     'Color(0xff03a9f4)': const Color(0xff03a9f4),
//     'Color(0xff00bcd4)': const Color(0xff00bcd4),
//     'Color(0xff009688)': const Color(0xff009688),
//     'Color(0xff4caf50)': const Color(0xff4caf50),
//     'Color(0xff8bc34a)': const Color(0xff8bc34a),
//     'Color(0xffcddc39)': const Color(0xffcddc39),
//     'Color(0xffffeb3b)': const Color(0xffffeb3b),
//     'Color(0xffffc107)': const Color(0xffffc107),
//     'Color(0xffff9800)': const Color(0xffff9800),
//     'Color(0xffff5722)': const Color(0xffff5722),
//     'Color(0xff795548)': const Color(0xff795548),
//     'Color(0xff9e9e9e)': const Color(0xff9e9e9e),
//     'Color(0xff607d8b)': const Color(0xff607d8b),
//     'Color(0xff000000)': const Color(0xff000000),
//     // يمكنك إضافة المزيد من الألوان هنا
//   };

//   // التحقق مما إذا كانت الألوان متاحة في القائمة
//   if (colors.containsKey(colorString)) {
//     return colors[colorString]!;
//   } else {
//     // إذا لم تكن اللون متاحًا، يمكنك إرجاع قيمة لون افتراضية هنا أو رمي استثناء
//     return Colors.black;
//   }
// }
