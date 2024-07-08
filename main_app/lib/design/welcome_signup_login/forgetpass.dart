import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

// ignore: camel_case_types
class forgetpass extends StatelessWidget {
  const forgetpass({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 8),
        alignment: Alignment.centerRight,
        child: Text(
          S.of(context).forget,
          style: const TextStyle(fontSize: 15),
        ));
  }
}
