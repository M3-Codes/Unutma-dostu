// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class Divider_login extends StatelessWidget {
  const Divider_login({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 322,
      child: Row(
        children: [
          const Expanded(
              child: Divider(thickness: 1, color: Color(0xFFc10080))),
          Text(
            " ${S.of(context).logindivider} ",
            style: const TextStyle(fontSize: 14, color: Color(0xFFc10080)),
          ),
          const Expanded(
              child: Divider(thickness: 1, color: Color(0xFFc10080))),
        ],
      ),
    );
  }
}
