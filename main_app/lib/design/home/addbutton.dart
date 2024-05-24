// ignore_for_file: camel_case_types

import 'dart:developer';

import 'package:flutter/material.dart';

class addbutton extends StatelessWidget {
  const addbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/insert');
        log("Tamam");
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFC1007F),
          fixedSize: const Size(100, 100),
          shape: const CircleBorder(
              side: BorderSide(color: Colors.black87, width: 3))),
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 50,
      ),
    );
  }
}
