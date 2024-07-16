// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../color_options.dart';
import '../../generated/l10n.dart';

class Divider_login extends StatelessWidget {
  const Divider_login({super.key});

  @override
  Widget build(BuildContext context) {
    final appColor = Provider.of<ColorProvider>(context).appColor;
    return SizedBox(
      width: 322,
      child: Row(
        children: [
          Expanded(child: Divider(thickness: 1, color: appColor)),
          Text(
            " ${S.of(context).logindivider} ",
            style: TextStyle(fontSize: 14, color: appColor),
          ),
          Expanded(child: Divider(thickness: 1, color: appColor)),
        ],
      ),
    );
  }
}
