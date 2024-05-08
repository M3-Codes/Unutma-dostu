import 'package:flutter/material.dart';
import 'package:home_page/design/textfont.dart';

// ignore: camel_case_types
class addbar extends StatelessWidget {
  final String title;
  const addbar(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFC1007F),
      title: TitleTextFont("Hoş Geldin $title"),
    );
  }
}
