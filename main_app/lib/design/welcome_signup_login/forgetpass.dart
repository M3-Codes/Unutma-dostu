import 'package:flutter/material.dart';

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
        child: const Text(
          "Forget Password ?",
          style: TextStyle(fontSize: 15),
        ));
  }
}
