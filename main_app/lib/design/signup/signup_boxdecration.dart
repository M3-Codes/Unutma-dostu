import 'package:flutter/material.dart';

class SignUpBoxdecration extends StatelessWidget {
  const SignUpBoxdecration({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(23), topRight: Radius.circular(23))),
        ));
  }
}
