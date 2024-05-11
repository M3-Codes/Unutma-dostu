import 'package:flutter/material.dart';
import '../design/logo.dart';
import '../design/signup_login/boxdecration.dart';
import '../design/signup_login/button.dart';
import '../design/signup_login/gradinet.dart';
import '../design/signup_login/inkwell.dart';
import '../design/signup_login/passwrodbox.dart';

import '../design/signup_login/textbox.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          const SLGradient(),
          const Logo(),
          const Column(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              SLBoxdecration(),
            ],
          ),
          const SizedBox(
            width: 345,
            child: Column(
              children: [
                SizedBox(height: 320),
                SLTextbox("Username", Icons.person),
                SizedBox(height: 20),
                SLTextbox("Email", Icons.email),
                SizedBox(height: 20),
                SLPasswordbox(),
                SizedBox(
                  height: 50,
                ),
                SLButton("SignUp"),
                SizedBox(
                  height: 20,
                ),
                SLInkwell("login", "Already Have An Account ? ", "Login")
              ],
            ),
          ),
          Positioned(
              bottom: 25,
              child: Image.asset(
                "images/yslogo.png",
                width: 250,
                height: 65,
              ))
        ],
      ),
    );
  }
}
