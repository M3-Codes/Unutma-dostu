import 'package:flutter/material.dart';

class Logo_UD extends StatelessWidget {
  const Logo_UD({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 70,
        child: Container(
            alignment: Alignment.center,
            width: 300,
            height: 150,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(25)),
            child: Image.asset(
              "images/Logo.png",
            )));
  }
}
