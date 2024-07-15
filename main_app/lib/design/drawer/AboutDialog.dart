import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../generated/l10n.dart';
import '../textfont.dart';

class AboutDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Image.asset('images/info.png', width: 30, height: 30),
            ),
            Textdesign(S.of(context).about, 25,
                fontWeight: FontWeight.w500, color: const Color(0xFFC1007F)),
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
            _buildContactRow(context, 'images/email.png',
                S.of(context).aboutus4, 'm3-codes@hotmail.com'),
            _buildContactRow(context, 'images/github.png',
                S.of(context).aboutus6, 'https://github.com/M3-Codes/M3-Codes'),
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
      ),
    );
  }

  Widget _buildContactRow(BuildContext context, String imagePath, String text,
      String clipboardText) {
    return GestureDetector(
      onTap: () {
        Clipboard.setData(ClipboardData(text: clipboardText));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(S.of(context).aboutus3)),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Image.asset(imagePath, width: 25, height: 25),
          ),
          Textdesign(text, 18),
        ],
      ),
    );
  }
}
