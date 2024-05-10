import 'package:flutter/material.dart';

class SingupInkwell extends StatelessWidget {
  const SingupInkwell({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(context, '/login');
      },
      child: const Center(
        child: Text.rich(TextSpan(children: [
          TextSpan(
              text: "Already Have An Account ? ",
              style: TextStyle(fontSize: 16)),
          TextSpan(
              text: "Login",
              style: TextStyle(
                  color: Color(0xFFc10080),
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
        ])),
      ),
    );
  }
}
