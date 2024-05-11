// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:welcome_signup_login/components/BG_sl.dart';
import 'package:welcome_signup_login/components/BG_text.dart';
import 'package:welcome_signup_login/components/buttonauth.dart';
import 'package:welcome_signup_login/components/changepage.dart';
import 'package:welcome_signup_login/components/divider_login.dart';
import 'package:welcome_signup_login/components/forgetpass.dart';
import 'package:welcome_signup_login/components/logo_M3_CODE.dart';
import 'package:welcome_signup_login/components/logo_UD.dart';
import 'package:welcome_signup_login/components/textform.dart';
import 'package:welcome_signup_login/components/textformpassword.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                    hinttext: "Email", ccontroller: email, icon: Icons.email),
                SizedBox(height: 20),
                TextForm_Password(ccontroller: password),
                forgetpass(),
                SizedBox(height: 20),
                ButtonAtuh(
                  title: " Login ",
                  horizontal: 144,
                  colorbackround: Color.fromARGB(255, 97, 4, 66),
                  colorfont: Color.fromARGB(255, 255, 255, 255),
                  onPressed: () {},
                ),
                SizedBox(height: 20),
                Divider_login(),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 97, 4, 66)),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 155, vertical: 10)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                  ),
                  child: Image.asset("images/google.png", width: 30),
                ),
                SizedBox(height: 20),
                ChangePage(
                    path: '/signup',
                    firstText: "Don't Have An Account ? ",
                    lastText: "Sign Up")
              ],
            ),
          ),
          Logo_M3_CODE_1(path: "images/yslogo.png")
        ],
      ),
    );
  }
}
