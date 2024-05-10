import 'package:flutter/material.dart';

import '../design/welcome/welcome_button.dart';
import '../design/welcome/welcome_gradient.dart';
import '../design/welcome/welcome_logo.dart';
import '../design/welcome/welcome_text.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const WelcomeGradient(),
          const WelcomeText(),
          const WelcomeLogo(),
          const Column(
            children: [
              SizedBox(
                height: 520,
              ),
              WelcomeButton("login", " Login "),
              SizedBox(
                height: 22,
              ),
              WelcomeButton("signup", "SignUp"),
            ],
          ),
          Positioned(
              bottom: 25,
              child: Image.asset(
                "images/ylogo.png",
                width: 250,
                height: 65,
              ))
        ],
      ),
    );
  }
}
