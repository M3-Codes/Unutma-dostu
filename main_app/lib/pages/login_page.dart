import 'package:flutter/material.dart';
import '../design/logo.dart';
import '../design/signup_login/boxdecration.dart';
import '../design/signup_login/button.dart';
import '../design/signup_login/gradinet.dart';
import '../design/signup_login/inkwell.dart';
import '../design/signup_login/login_divider.dart';
import '../design/signup_login/login_forgetpass.dart';
import '../design/signup_login/login_googleButton.dart';
import '../design/signup_login/passwrodbox.dart';
import '../design/signup_login/textbox.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                SLTextbox("Email", Icons.email),
                SizedBox(height: 20),
                SLPasswordbox(),
                LoginForgetPass(),
                SizedBox(
                  height: 20,
                ),
                SLButton(" Login "),
                SizedBox(height: 20),
                SizedBox(
                  width: 330,
                  child: LoginDivider(),
                ),
                SizedBox(
                  height: 20,
                ),
                LoginGoogleButton(),
                SizedBox(
                  height: 20,
                ),
                SLInkwell("signup", "Don't Have An Account ? ", "Sign Up")
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
