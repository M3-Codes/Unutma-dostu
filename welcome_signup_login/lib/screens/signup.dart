// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:welcome_signup_login/components/BG_sl.dart';
import 'package:welcome_signup_login/components/BG_text.dart';
import 'package:welcome_signup_login/components/buttonauth.dart';
import 'package:welcome_signup_login/components/changepage.dart';
import 'package:welcome_signup_login/components/logo_M3_CODE.dart';
import 'package:welcome_signup_login/components/logo_UD.dart';
import 'package:welcome_signup_login/components/textform.dart';
import 'package:welcome_signup_login/components/textformpassword.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          BG_sl(),
          Logo_UD(),
          BG_text(),
          SizedBox(
            width: 345,
            child: Column(
              children: [
                SizedBox(height: 320),
                TextForm(
                    hinttext: "Username",
                    ccontroller: username,
                    icon: Icons.person),
                SizedBox(height: 20),
                TextForm(
                    hinttext: "Email", ccontroller: email, icon: Icons.email),
                SizedBox(height: 20),
                TextForm_Password(ccontroller: password),
                SizedBox(height: 50),
                ButtonAtuh(
                  title: "SignUp",
                  horizontal: 140,
                  colorbackround: Color.fromARGB(255, 97, 4, 66),
                  colorfont: Color.fromARGB(255, 255, 255, 255),
                  onPressed: () async {
                    try {
                      final credential = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: email.text,
                        password: password.text,
                      );
                      Navigator.of(context).pushReplacementNamed("/homepage");
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
                SizedBox(height: 20),
                ChangePage(
                    path: '/login',
                    firstText: "Already Have An Account ? ",
                    lastText: "Login")
              ],
            ),
          ),
          Logo_M3_CODE_1(
            path: "images/yslogo.png",
          )
        ],
      ),
    );
  }
}
