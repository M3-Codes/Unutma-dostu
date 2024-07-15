import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../generated/l10n.dart';
import '../../language_provider.dart';
import '../textfont.dart';

class LanguageSelectionDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(S.of(context).selectlan),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              Provider.of<LanguageProvider>(context, listen: false)
                  .setLocale(const Locale('en'));
              Navigator.of(context).pop();
            },
            child: const Textdesign('English', color: Color(0xFFc10080), 16),
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<LanguageProvider>(context, listen: false)
                  .setLocale(const Locale('tr'));
              Navigator.of(context).pop();
            },
            child: const Textdesign('Türkçe', color: Color(0xFFc10080), 16),
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<LanguageProvider>(context, listen: false)
                  .setLocale(const Locale('ar'));
              Navigator.of(context).pop();
            },
            child: const Textdesign('العربية', color: Color(0xFFc10080), 16),
          ),
        ],
      ),
    );
  }
}
