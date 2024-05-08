import 'package:flutter/material.dart';

class ImageSwitcher extends StatefulWidget {
  @override
  _ImageSwitcherState createState() => _ImageSwitcherState();
}

class _ImageSwitcherState extends State<ImageSwitcher> {
  AssetImage firstImage = const AssetImage('images/box2.jpg');
  AssetImage secondImage = const AssetImage('images/box1.jpg');
  bool isSwitched = false;

  void switchImage() {
    setState(() {
      isSwitched = !isSwitched;
    });
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
