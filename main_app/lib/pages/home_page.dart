import 'package:flutter/material.dart';
import 'package:main_app/design/home/home_drawer.dart';
import '../design/home/addbar.dart';
import '../design/home/addbutton.dart';
import '../design/home/divider.dart';
import '../design/home/imageswitcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer_h(),
      body: Column(
        children: <Widget>[
          const addbar(),
          Masafe_H(),
          Expanded(
            child: RawScrollbar(
              thumbColor: const Color(0xFFC1007F),
              radius: const Radius.circular(5),
              thickness: 9.0,
              thumbVisibility: true,
              controller: _scrollController,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    for (var rowItems in repeatedRowItems)
                      Column(
                        children: [
                          RowBoxes(rowItems),
                          const divider(),
                          Masafe_H(),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
          const addbutton(),
          Masafe_H(),
          Container(
            alignment: Alignment.bottomCenter,
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

class RowBoxes extends StatelessWidget {
  final List<int> indexes;

  const RowBoxes(this.indexes, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var index in indexes) ...[
          const SizedBox(width: 30),
          ImageSwitcher(index),
          const SizedBox(width: 15),
        ],
      ],
    );
  }
}

// العناصر المتكررة لكل صف
final List<List<int>> repeatedRowItems = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9],
  [10, 11, 12],
  [13, 14, 15],
  [16, 17, 18],
  [19, 20, 21],
  // يمكنك إضافة المزيد من القوائم حسب الحاجة
];

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
