// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../../pages/view_page.dart';

List<bool> list = [
  true,
  true,
  true,
  true,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false
];

class ImageSwitcher extends StatefulWidget {
  final int index;
  const ImageSwitcher(this.index, {super.key});

  @override
  _ImageSwitcherState createState() => _ImageSwitcherState();
}

class _ImageSwitcherState extends State<ImageSwitcher> {
  AssetImage firstImage = const AssetImage('images/box2.jpg');
  AssetImage secondImage = const AssetImage('images/box1.jpg');
  bool isSwitched = false;

  void switchImage() {
    if (list[widget.index - 1]) {
      setState(() {
        isSwitched = !isSwitched;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          // switchImage();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ViewPage(index: widget.index),
            ),
          );
          ;
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
    );
  }
}
