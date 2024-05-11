import 'package:flutter/material.dart';

class BG_sl extends StatelessWidget {
  const BG_sl({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFFc10080), Color(0xFF000000), Color(0xFF000000)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
    );
  }
}
