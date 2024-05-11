import 'package:flutter/material.dart';

class WelcomeButton extends StatelessWidget {
  final String page;
  final String text;
  const WelcomeButton(
    this.page,
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, "/$page");
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.grey[300]),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 132, vertical: 10)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 20, color: Colors.grey[850]),
      ),
    );
  }
}
