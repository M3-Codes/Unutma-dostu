import 'package:flutter/material.dart';

class LoginDivider extends StatelessWidget {
  const LoginDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider(thickness: 1, color: Color(0xFFc10080))),
        Text(
          " Or Login With ",
          style: TextStyle(fontSize: 16, color: Color(0xFFc10080)),
        ),
        Expanded(child: Divider(thickness: 1, color: Color(0xFFc10080))),
      ],
    );
  }
}
