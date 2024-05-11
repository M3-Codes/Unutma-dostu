import 'package:flutter/material.dart';

class LoginForgetPass extends StatelessWidget {
  const LoginForgetPass({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        alignment: Alignment.centerRight,
        child: const Text(
          "Forget Password ?",
          style: TextStyle(fontSize: 16),
        ));
  }
}
