import 'package:flutter/material.dart';
import 'package:welcome_signup_login/screens/login.dart';
import 'package:welcome_signup_login/screens/signup.dart';
import 'package:welcome_signup_login/screens/welcome.dart';
//import 'package:firebase_core/firebase_core.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => Welcome(),
        '/login': (context) => Login(),
        '/signup': (context) => Signup()
      },
    );
  }
}
