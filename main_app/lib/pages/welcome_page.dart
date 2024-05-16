import 'package:flutter/material.dart';

import '../design/welcome_signup_login/BG_w.dart';
import '../design/welcome_signup_login/buttonauth.dart';
import '../design/welcome_signup_login/logo_M3_CODE.dart';
import '../design/welcome_signup_login/logo_UD.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const BG_w(),
          Flexible(
              flex: 8,
              child: Container(
                height: 240,
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 40.0,
                ),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                          text: 'Hoşgeldiniz!\n',
                          style: TextStyle(
                            fontSize: 45.0,
                            fontWeight: FontWeight.w600,
                          )),
                      TextSpan(
                          text: '\nKişisel bilgileri çalışan hesabınıza girin',
                          style: TextStyle(
                            fontSize: 20,
                            // height: 0,
                          ))
                    ],
                  ),
                ),
              )),
          const Logo_UD(),
          Column(
            children: [
              const SizedBox(
                height: 520,
              ),
              ButtonAtuh(
                title: " Login ",
                horizontal: 132,
                colorbackround: const Color(0xFFE0E0E0),
                colorfont: const Color(0xFF303030),
                onPressed: () {
                  Navigator.pushNamed(context, "/login");
                },
              ),
              const SizedBox(
                height: 22,
              ),
              ButtonAtuh(
                title: "SignUp",
                horizontal: 130,
                colorbackround: const Color(0xFFE0E0E0),
                colorfont: const Color(0xFF303030),
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
              ),
            ],
          ),
          const Logo_M3_CODE_1(path: "images/ylogo.png")
        ],
      ),
    );
  }
}
