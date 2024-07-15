import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../language_provider.dart';
import '../textfont.dart';

class LanguageButton extends StatelessWidget {
  final Locale locale;
  final String language;

  const LanguageButton({
    Key? key,
    required this.locale,
    required this.language,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Provider.of<LanguageProvider>(context, listen: false).setLocale(locale);
        Navigator.of(context).pop();
      },
      child: Textdesign(language, color: Color(0xFFc10080), 16),
    );
  }
}
