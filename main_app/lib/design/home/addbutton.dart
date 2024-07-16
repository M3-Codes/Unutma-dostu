// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../color_options.dart';
import '../../pages/insert_page.dart';

class addbutton extends StatelessWidget {
  const addbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appColor = Provider.of<ColorProvider>(context).appColor;
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const InsertPage(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: appColor,
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
