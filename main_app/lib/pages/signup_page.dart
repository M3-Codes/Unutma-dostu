import 'package:flutter/material.dart';
import '../design/signup/signup_boxdecration.dart';
import '../design/signup/signup_button.dart';
import '../design/signup/signup_gradinet.dart';
import '../design/signup/signup_inkwell.dart';
import '../design/signup/signup_passwrodbox.dart';
import '../design/signup/singup_logo.dart';
import '../design/signup/singup_textbox.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          const SignupGradient(),
          const SignupLogo(),
          const Column(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              SignUpBoxdecration(),
            ],
          ),
          const SizedBox(
            width: 345,
            child: Column(
              children: [
                SizedBox(height: 320),
                SignupTextbox("Username", Icons.person),
                SizedBox(height: 20),
                SignupTextbox("Email", Icons.email),
                SizedBox(height: 20),
                SignupPasswordbox(),
                SizedBox(
                  height: 50,
                ),
                SignupButton(),
                SizedBox(
                  height: 20,
                ),
                SingupInkwell()
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
