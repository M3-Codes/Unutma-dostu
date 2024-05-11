import 'package:flutter/material.dart';

class Logo_M3_CODE_1 extends StatelessWidget {
  const Logo_M3_CODE_1({super.key, required this.path});
  final String path;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 25,
        child: Image.asset(
          path,
          width: 250,
          height: 65,
        ));
  }
}
