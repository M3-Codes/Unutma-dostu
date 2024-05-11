import 'package:flutter/material.dart';

class SLInkwell extends StatelessWidget {
  final String page;
  final String text;
  final String textButton;
  const SLInkwell(
    this.page,
    this.text,
    this.textButton, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(context, '/$page');
      },
      child: Center(
        child: Text.rich(TextSpan(children: [
          TextSpan(text: text, style: const TextStyle(fontSize: 16)),
          TextSpan(
              text: textButton,
              style: const TextStyle(
                  color: Color(0xFFc10080),
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
        ])),
      ),
    );
  }
}
