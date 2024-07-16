// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../color_options.dart';
import '../../datebase/CsvManager.dart';
import '../../datebase/UserManager.dart';
// import '../../datebase/file_manager.dart';
import '../../pages/view_page.dart';
import '../textfont.dart';

class ImageSwitcher extends StatefulWidget {
  final int index;
  const ImageSwitcher(this.index, {super.key});

  @override
  _ImageSwitcherState createState() => _ImageSwitcherState();
}

class _ImageSwitcherState extends State<ImageSwitcher> {
  late List<bool> list = [];
  late List<String> etkitlist = [];
  late List database = [];
  late List<String> time1;

  AssetImage firstImage = const AssetImage('images/box2Fuchsia.png');
  AssetImage secondImage = const AssetImage('images/box1Fuchsia.png');
  bool isSwitched = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    String clinet = UserManager().clientName();
    CsvManager fileReader = CsvManager();
    List<bool> fetchedList = await fileReader.isFull();
    List<String> etkit = await fileReader.tags();
    database = await fileReader.readFromNewFile(clinet);
    setState(() {
      list = fetchedList;
      etkitlist = etkit;
      if (list[(widget.index) - 1]) {
        time1 = database[widget.index][5].toString().split(':');
      }
    });
  }

  void switchImage() {
    if (list[widget.index - 1]) {
      setState(() {
        isSwitched = !isSwitched;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<ColorProvider>(context);
    final appColor = colorProvider.appColor;

    // Determine the color name based on the current app color
    String colorName = 'Fuchsia'; // Default color name
    if (appColor == const Color(0xFFd32f2f)) {
      colorName = 'Red';
    } else if (appColor == Colors.green) {
      colorName = 'Green';
    } else if (appColor == Colors.blue) {
      colorName = 'Blue';
    } else if (appColor == Colors.cyan) {
      colorName = 'Cyan';
    } else if (appColor == Colors.purple) {
      colorName = 'Purple';
    } else if (appColor == Color(0xFFC1007F)) {
      colorName = 'Fuchsia';
    }

    firstImage = AssetImage('images/box2$colorName.png');
    secondImage = AssetImage('images/box1$colorName.png');

    if (list.isEmpty || widget.index - 1 >= list.length) {
      return Lottie.asset(
        'images/boxload.json',
        width: 80,
        height: 80,
        fit: BoxFit.cover,
      );
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ViewPage(index: widget.index),
                ),
              );
            },
            child: IgnorePointer(
              ignoring: !list[(widget.index) - 1],
              child: Image(
                image: list[(widget.index) - 1] ? secondImage : firstImage,
                width: 80,
                height: 80,
              ),
            ),
          ),
          Textdesign(
            list[(widget.index) - 1] ? etkitlist[widget.index - 1] : " ",
            12,
          ),
        ],
      ),
    );
  }
}
