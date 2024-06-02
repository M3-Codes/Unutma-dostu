// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_import

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return;

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.of(context)
        .pushNamedAndRemoveUntil("/homepage", (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          BGsl(),
          Logo_UD(),
          BG_text(),
          SizedBox(
            width: 345,
            child: Form(
              key: formState,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Expanded(
                      flex: 2,
                      child: ListView(
                        padding: const EdgeInsets.only(top: 0),
                        children: [
                          Container(height: 43),
                          Column(
                            children: [
                              TextForm(
                                  hinttext: "Email",
                                  ccontroller: email,
                                  icon: Icons.email,
                                  validator: (val) {
                                    if (val == "")
                                      return "Please fill out this field";
                                  }),
                              SizedBox(height: 18),
                              TextForm_Password(
                                  ccontroller: password,
                                  validator: (val) {
                                    if (val == "")
                                      return "Please fill out this field";
                                  }),
                              InkWell(
                                  onTap: () async {
                                    if (email.text == "") {
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.error,
                                        animType: AnimType.rightSlide,
                                        title: 'ُError',
                                        desc:
                                            'Please enter your email and then click Forgot Password',
                                        btnOkOnPress: () {},
                                      ).show();
                                      return;
                                    }
                                    try {
                                      await FirebaseAuth.instance
                                          .sendPasswordResetEmail(
                                              email: email.text);
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.success,
                                        animType: AnimType.rightSlide,
                                        title: 'Success',
                                        desc:
                                            'A link to reset your password has been sent to your email',
                                        btnOkOnPress: () {},
                                      ).show();
                                    } catch (e) {
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.error,
                                        animType: AnimType.rightSlide,
                                        title: 'Error',
                                        desc:
                                            'Please make sure that the email you entered is correct',
                                        btnOkOnPress: () {},
                                      ).show();
                                    }
                                  },
                                  child: forgetpass()),
                              SizedBox(height: 18),
                            ],
                          ),
                          ButtonAtuh(
                            title: "  Login  ",
                            horizontal: 0,
                            colorbackround: Color.fromARGB(255, 97, 4, 66),
                            colorfont: Color.fromARGB(255, 255, 255, 255),
                            onPressed: () async {
                              if (formState.currentState!.validate()) {
                                try {
                                  final credential = await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: email.text,
                                          password: password.text);
                                  if (credential.user!.emailVerified) {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            '/homepage', (route) => false);
                                  } else {
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.infoReverse,
                                      animType: AnimType.rightSlide,
                                      title: 'INFO',
                                      desc:
                                          'Please click the activation link we sent to your email',
                                      //btnCancelOnPress: () {},
                                      btnOkOnPress: () {},
                                    ).show();
                                  }
                                } on FirebaseAuthException catch (e) {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.error,
                                    animType: AnimType.rightSlide,
                                    title: 'Error',
                                    desc: e.code,
                                    btnOkOnPress: () {},
                                  ).show();
                                }
                              } else {
                                print("Not valid");
                              }
                            },
                          ),
                          SizedBox(height: 14),
                          Column(children: [Divider_login()]),
                          SizedBox(height: 14),
                          ElevatedButton(
                            onPressed: () {
                              signInWithGoogle();
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 97, 4, 66)),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(
                                      horizontal: 155, vertical: 10)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                            ),
                            child: Image.asset("images/google.png", width: 30),
                          ),
                          SizedBox(height: 19),
                          ChangePage(
                              path: '/signup',
                              firstText: "Don't Have An Account ? ",
                              lastText: "Sign Up")
                        ],
                      )),
                ],
              ),
            ),
          ),
          Logo_M3_CODE_1(path: "images/yslogo.png")
        ],
      ),
    );
  }
}
