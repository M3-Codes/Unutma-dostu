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
  @override
  void initState() {
    try {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {});
      super.initState();
      _isLoading = false;
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return MaterialApp(
      navigatorKey: MyApp.navigatorKey,
      debugShowCheckedModeBanner: false,
      //initialRoute: '/homepage',
      //initialRoute: '/',
      initialRoute: (FirebaseAuth.instance.currentUser != null &&
              FirebaseAuth.instance.currentUser!.emailVerified)
          ? '/homepage'
          : '/',
      //home: Homepage(),
      routes: {
        '/': (context) => const Welcome(),
        '/login': (context) => const Login(),
        '/signup': (context) => const Signup(),
        '/homepage': (context) => const HomePage()
      },
    );
  }
}
