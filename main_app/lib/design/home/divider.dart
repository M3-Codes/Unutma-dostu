// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class divider extends StatelessWidget {
  const divider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      indent: 30,
      endIndent: 30,
      thickness: 10, // سمك الخط
      color: Color.fromARGB(255, 16, 16, 16),
    );
  }
}
