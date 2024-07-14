// ignore_for_file: library_private_types_in_public_api
import 'package:UnutmaDostu/design/textfont.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../datebase/file_reader.dart';
import '../../pages/view_page.dart';

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

  AssetImage firstImage = const AssetImage('images/box2.jpg');
  AssetImage secondImage = const AssetImage('images/box1.jpg');
  bool isSwitched = false;

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  void fetchData() async {
    FileReader fileReader = FileReader();
    List<bool> fetchedList = await fileReader.doluMU();
    List<String> etkit = await fileReader.etiktler();
    database = await fileReader.readFromNewFile();
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
