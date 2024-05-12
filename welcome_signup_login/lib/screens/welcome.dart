// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:welcome_signup_login/components/BG_w.dart';
import 'package:welcome_signup_login/components/buttonauth.dart';
import 'package:welcome_signup_login/components/logo_M3_CODE.dart';
import 'package:welcome_signup_login/components/logo_UD.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          BG_w(),
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
          Logo_UD(),
          Column(
            children: [
              SizedBox(
                height: 520,
              ),
              ButtonAtuh(
                title: " Login ",
                horizontal: 132,
                colorbackround: Color(0xFFE0E0E0),
                colorfont: Color(0xFF303030),
                onPressed: () {
                  Navigator.pushNamed(context, "/login");
                },
              ),
              SizedBox(
                height: 22,
              ),
              ButtonAtuh(
                title: "SignUp",
                horizontal: 130,
                colorbackround: Color(0xFFE0E0E0),
                colorfont: Color(0xFF303030),
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
              ),
            ],
          ),
          Logo_M3_CODE_1(path: "images/ylogo.png")
        ],
      ),
    );
  }
}
