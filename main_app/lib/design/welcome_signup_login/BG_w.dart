import 'package:flutter/material.dart';

class BG_w extends StatelessWidget {
  const BG_w({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFFc10080), Color(0xFF000000)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
    );
  }
}
