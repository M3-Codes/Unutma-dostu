import 'package:flutter/material.dart';

class SLButton extends StatelessWidget {
  final String text;
  const SLButton(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(const Color.fromARGB(255, 97, 4, 66)),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 140, vertical: 10)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
      ),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 20, color: Color.fromARGB(255, 255, 255, 255)),
      ),
    );
  }
}
