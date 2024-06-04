// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
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
    setState(() {
      list = fetchedList;
      etkitlist = etkit;
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
      return const CircularProgressIndicator();
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              // switchImage();
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
          Text(
            list[(widget.index) - 1] ? etkitlist[widget.index - 1] : " ",
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
