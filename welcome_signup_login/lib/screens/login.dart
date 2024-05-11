// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:welcome_signup_login/components/BG_2.dart';
import 'package:welcome_signup_login/components/BG_3.dart';
import 'package:welcome_signup_login/components/buttonauth.dart';
import 'package:welcome_signup_login/components/changepage.dart';
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
          BG_2(),
          Logo_UD(),
          BG_3(),
          SizedBox(
            width: 345,
            child: Column(
              children: [
                SizedBox(height: 320),
                TextForm(hinttext: "Email", ccontroller: email),
                SizedBox(height: 20),
                TextForm_Password(ccontroller: password),
                Container(
                    margin: EdgeInsets.only(top: 10),
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forget Password ?",
                      style: TextStyle(fontSize: 16),
                    )),
                SizedBox(height: 20),
                ButtonAtuh(
                  title: " Login ",
                  horizontal: 144,
                  colorbackround: Color.fromARGB(255, 97, 4, 66),
                  colorfont: Color.fromARGB(255, 255, 255, 255),
                  onPressed: () {},
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 330,
                  child: Row(
                    children: [
                      Expanded(
                          child:
                              Divider(thickness: 1, color: Color(0xFFc10080))),
                      Text(
                        " Or Login With ",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xFFc10080)),
                      ),
                      Expanded(
                          child:
                              Divider(thickness: 1, color: Color(0xFFc10080))),
                    ],
                  ),
                ),
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
          Logo_M3_CODE_1()
        ],
      ),
    );
  }
}
