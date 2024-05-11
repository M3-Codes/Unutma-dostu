import 'package:flutter/material.dart';
import 'package:home_page/design/addbar.dart';
import 'package:home_page/design/addbutton.dart';
import 'package:home_page/design/divider.dart';
import 'package:home_page/design/imageswitcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(children: <Widget>[
          const addbar("Admin"),
          Masafe_H(),
          const Row(
            children: [
              SizedBox(
                width: 45,
              ),
              ImageSwitcher(1),
              SizedBox(width: 30),
              ImageSwitcher(2),
              SizedBox(width: 30),
              ImageSwitcher(3),
            ],
          ),
          Masafe_B(),
          const divider(),
          Masafe_H(),
          const Row(
            children: [
              SizedBox(
                width: 45,
              ),
              ImageSwitcher(4),
              SizedBox(width: 30),
              ImageSwitcher(5),
              SizedBox(width: 30),
              ImageSwitcher(6),
            ],
          ),
          Masafe_B(),
          const divider(),
          Masafe_H(),
          const Row(
            children: [
              SizedBox(
                width: 45,
              ),
              ImageSwitcher(7),
              SizedBox(width: 30),
              ImageSwitcher(8),
              SizedBox(width: 30),
              ImageSwitcher(9),
            ],
          ),
          Masafe_B(),
          const divider(),
          Masafe_H(),
          const addbutton(),
          Masafe_H(),
          Container(
              alignment: Alignment.bottomCenter,
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
    height: 30,
  );
}

// ignore: non_constant_identifier_names
Widget Masafe_B() {
  return const SizedBox(
    height: 5,
  );
}
