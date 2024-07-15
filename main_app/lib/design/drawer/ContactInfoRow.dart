import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../textfont.dart';

class ContactInfoRow extends StatelessWidget {
  final String iconPath;
  final String text;
  final String snackBarMessage;

  const ContactInfoRow({
    required this.iconPath,
    required this.text,
    required this.snackBarMessage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Clipboard.setData(ClipboardData(text: text));
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(snackBarMessage)));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Image.asset(iconPath, width: 25, height: 25),
          ),
          Textdesign(text, 18),
        ],
      ),
    );
  }
}
