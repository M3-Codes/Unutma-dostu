import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:main_app/firebase_options.dart';
import 'package:main_app/pages/home_page.dart';
import 'package:main_app/pages/insert_page.dart';
import 'package:main_app/pages/login_page.dart';
import 'package:main_app/pages/signup_page.dart';
import 'package:main_app/pages/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print(
            '********************************** User is currently signed out!');
      } else {
        print(
            '********************************************* User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        '/insert': (context) => const InsertPage(),
        '/homepage': (context) => const HomePage()
      },
    );
  }
}
