import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../color_options.dart';
import '../../generated/l10n.dart';
import '../../language_provider.dart';
import '../textfont.dart';

class LanguageSelectionDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appColor = Provider.of<ColorProvider>(context).appColor;
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
            child: Textdesign('English', color: appColor, 16),
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<LanguageProvider>(context, listen: false)
                  .setLocale(const Locale('tr'));
              Navigator.of(context).pop();
            },
            child: Textdesign('Türkçe', color: appColor, 16),
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<LanguageProvider>(context, listen: false)
                  .setLocale(const Locale('ar'));
              Navigator.of(context).pop();
            },
            child: Textdesign('العربية', color: appColor, 16),
          ),
        ],
      ),
    );
  }
}
