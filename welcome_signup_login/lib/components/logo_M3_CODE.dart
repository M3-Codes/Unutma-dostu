import 'package:flutter/material.dart';

class Logo_M3_CODE_1 extends StatelessWidget {
  const Logo_M3_CODE_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 25,
        child: Image.asset(
          "images/yslogo.png",
          width: 250,
          height: 65,
        ));
  }
}

class Logo_M3_CODE_2 extends StatelessWidget {
  const Logo_M3_CODE_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 25,
        child: Image.asset(
          "images/ylogo.png",
          width: 250,
          height: 65,
        ));
  }
}
