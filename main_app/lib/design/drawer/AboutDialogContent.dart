import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../color_options.dart';
import '../../generated/l10n.dart';
import '../textfont.dart';
import 'ContactInfoRow.dart';

class AboutDialogContent extends StatelessWidget {
  const AboutDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    final appColor = Provider.of<ColorProvider>(context).appColor;
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Image.asset('images/info.png', width: 30, height: 30),
          ),
          Textdesign(S.of(context).about, 25,
              fontWeight: FontWeight.w500, color: appColor),
        ],
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Textdesign(S.of(context).aboutus1, 20),
          Textdesign(S.of(context).aboutus2, 20),
          const SizedBox(height: 50.0),
          ContactInfoRow(
            iconPath: 'images/email.png',
            text: 'm3-codes@hotmail.com',
            snackBarMessage: S.of(context).aboutus3,
          ),
          const SizedBox(height: 30.0),
          ContactInfoRow(
            iconPath: 'images/github.png',
            text: ('https://github.com/\nM3-Codes/M3-Codes'),
            snackBarMessage: S.of(context).aboutus5,
          ),
          GestureDetector(
            onTap: () {
              Clipboard.setData(
                  const ClipboardData(text: 'https://github.com/M3-Codes'));
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(S.of(context).aboutus5)));
            },
            child: const Textdesign('https://github.com', 16,
                align: TextAlign.center),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: Text(S.of(context).close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
