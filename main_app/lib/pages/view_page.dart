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
  late List<dynamic> data;
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
      data = database[widget.index];
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
                    reader.deleteRow(
                        database[widget.index][0],
                        database[widget.index][1],
                        database[widget.index][7].toString(),
                        database[widget.index][8].toString(),
                        "",
                        "");
                  },
                  data: data,
                ),
                Masafe_H(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Imagesbutton(
                        text: 'Ürün eki', path: database[widget.index][7]),
                    const SizedBox(width: 25),
                    Imagesbutton(
                        text: 'Yer eki', path: database[widget.index][8]),
                  ],
                ),
                Masafe_H(),
                const SizedBox(width: 10),
                readingboxes(
                    hintText: database[widget.index][0].toString(),
                    title: 'Ürün Adı '),
                readingboxes(
                    hintText: database[widget.index][1].toString(),
                    title: 'Açıklama'),
                readingboxes(
                    hintText: database[widget.index][2].toString(),
                    title: 'Yer           '),
                labelColor(
                    color: Color(database[widget.index][4]),
                    text: database[widget.index][3].toString()),
                AgainTime(hour: time[0], minute: time[1], second: time[2]),
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
