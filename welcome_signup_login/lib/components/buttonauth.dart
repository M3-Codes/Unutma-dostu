import 'package:flutter/material.dart';

class ButtonAtuh extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final double horizontal;
  final Color colorbackround;
  final Color colorfont;
  const ButtonAtuh(
      {super.key,
      this.onPressed,
      required this.title,
      required this.horizontal,
      required this.colorbackround,
      required this.colorfont});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(colorbackround),
        padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(horizontal: horizontal, vertical: 10)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
      ),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, color: colorfont),
      ),
    );
  }
}
