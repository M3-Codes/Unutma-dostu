import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:welcome_signup_login/firebase_options.dart';
import 'package:welcome_signup_login/screens/login.dart';
import 'package:welcome_signup_login/screens/signup.dart';
import 'package:welcome_signup_login/screens/welcome.dart';
//import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Welcome(),
        '/login': (context) => const Login(),
        '/signup': (context) => const Signup()
      },
    );
  }
}
