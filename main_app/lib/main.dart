import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:UnutmaDostu/firebase_options.dart';
import 'package:UnutmaDostu/pages/home_page.dart';
import 'package:UnutmaDostu/pages/login_page.dart';
import 'package:UnutmaDostu/pages/signup_page.dart';
import 'package:UnutmaDostu/pages/welcome_page.dart';
import 'package:UnutmaDostu/services/notification_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'generated/l10n.dart';
import 'language_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initializeNotification();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoading = true;
  Locale _locale = const Locale('en'); // اللغة الافتراضية

  void _setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void initState() {
    try {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {});
      super.initState();
      _isLoading = false;
    } catch (e) {
      log(e.toString());
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
      ],
      child: Consumer<LanguageProvider>(
        builder: (context, languageProvider, child) {
          return MaterialApp(
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''), // English
              Locale('tr', ''), // Turkish
              Locale('ar', ''), // Arabic
            ],
            locale: languageProvider.locale, // Active locale
            navigatorKey: MyApp.navigatorKey,
            debugShowCheckedModeBanner: false,
            home: FirebaseAuth.instance.currentUser != null &&
                    FirebaseAuth.instance.currentUser!.emailVerified
                ? const HomePage()
                : const Welcome(),
            routes: {
              '/welcome': (context) => const Welcome(),
              '/login': (context) => const Login(),
              '/signup': (context) => const Signup(),
              '/homepage': (context) => const HomePage(),
            },
          );
        },
      ),
    );
  }
}
