// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

List<bool> list = [true, false, true, false, true, true, false, true, false];

class ImageSwitcher extends StatefulWidget {
  const ImageSwitcher(this.index, {super.key});

  final int index;

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
          switchImage();
        },
        child: Image(
          image: isSwitched ? secondImage : firstImage,
          width: 80,
          height: 80,
        ),
      ),
    );
  }
}
