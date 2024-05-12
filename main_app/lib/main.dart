import 'package:flutter/material.dart';
import 'package:main_app/pages/home_page.dart';
import 'package:main_app/pages/insert_page.dart';
import 'package:main_app/pages/login_page.dart';
import 'package:main_app/pages/signup_page.dart';
import 'package:main_app/pages/view_page.dart';
import 'package:main_app/pages/welcome_page.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/': (context) => const Welcome(),
        '/view': (context) => const ViewPage(),
        '/insert': (context) => const InsertPage(),
        '/login': (context) => const Login(),
        '/signup': (context) => const Signup()
      },
    );
  }
}
