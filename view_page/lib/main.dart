import 'package:flutter/material.dart';
import 'package:view_page/design/Imagesbutton.dart';
import 'package:view_page/design/againtime.dart';
import 'package:view_page/design/daydate.dart';
import 'package:view_page/design/labelcolor.dart';
import 'package:view_page/design/readingboxes.dart';
import 'package:view_page/design/textfont.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            AppBar(
              title: const TitleTextFont("Araba Anahtari"),
            ),
            Masafe_H(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Imagesbutton("Ürün eki"),
                SizedBox(
                  width: 25,
                ),
                Imagesbutton("Yer eki")
              ],
            ),
            Masafe_H(),
            const SizedBox(
              width: 10,
            ),
            const readingboxes("Araba Anahatrı", "Ürün Adı"),
            const readingboxes("Opel Araba Anahatarı", "Açıklama"),
            const readingboxes("kapı Aarksı Askılık", "Yer           "),
            const labelColor("#CarKey"),
            const AgainTime("01", "00", "40"),
            const DayDate("02", "01", "2001"),
            Masafe_H(),
            Container(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "images/m3code.jpg",
                width: 250,
              ),
            )
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
