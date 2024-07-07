import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _locale = const Locale('en'); // اللغة الافتراضية

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.supportedLocales.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = const Locale('en'); // إعادة تعيين اللغة الافتراضية
    notifyListeners();
  }
}

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('ar'),
    const Locale('tr'),
  ];

  static const supportedLocales = [
    Locale('en'),
    Locale('ar'),
    Locale('tr'),
  ];

  static String getFlag(String code) {
    switch (code) {
      case 'en':
        return '🇺🇸';
      case 'ar':
        return '🇸🇦';
      case 'tr':
        return '🇹🇷';
      default:
        return '🏳️';
    }
  }
}
