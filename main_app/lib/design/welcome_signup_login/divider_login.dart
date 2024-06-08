// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class Divider_login extends StatelessWidget {
  const Divider_login({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 322,
      child: Row(
        children: [
          Expanded(child: Divider(thickness: 1, color: Color(0xFFc10080))),
          Text(
            " Or Login With ",
            style: TextStyle(fontSize: 14, color: Color(0xFFc10080)),
          ),
          Expanded(child: Divider(thickness: 1, color: Color(0xFFc10080))),
        ],
      ),
    );
  }
}
