import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:UnutmaDostu/design/home/home_drawer.dart';
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

  bool _doubleBackToExitPressedOnce = false;
  Key _scaffoldKey = UniqueKey();

  Future<bool> _onWillPop() async {
    if (_doubleBackToExitPressedOnce) {
      SystemNavigator.pop();
      return true;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Çıkmak için tekrar geri tuşuna basın'),
        duration: Duration(seconds: 2),
        backgroundColor: Color(0xFFC1007F),
      ),
    );

    _doubleBackToExitPressedOnce = true;
    Future.delayed(const Duration(seconds: 2), () {
      _doubleBackToExitPressedOnce = false;
    });

    return false;
  }

  Future<void> _refreshPage() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _scaffoldKey = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const Drawer_h(),
        body: RefreshIndicator(
          onRefresh: _refreshPage,
          child: Column(
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
        ),
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

final List<List<int>> repeatedRowItems = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9],
  [10, 11, 12],
  [13, 14, 15],
  [16, 17, 18],
  [19, 20, 21],
];

// ignore: non_constant_identifier_names
Widget Masafe_H() {
  return const SizedBox(
    height: 20,
  );
}

// ignore: non_constant_identifier_names
Widget Masafe_B() {
  return const SizedBox(
    height: 5,
  );
}
