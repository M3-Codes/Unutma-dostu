// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  GlobalKey<FormState> formState = GlobalKey<FormState>();

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
              child: Column(children: [
                const Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                    flex: 2,
                    child: ListView(
                      padding: const EdgeInsets.only(top: 0),
                      children: [
                        Container(height: 43),
                        Column(children: [
                          TextForm(
                              hinttext: "Username",
                              ccontroller: username,
                              icon: Icons.person,
                              validator: (val) {
                                if (val == "")
                                  return "Please fill out this field";
                              }),
                          SizedBox(height: 18),
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
                          SizedBox(height: 43),
                        ]),
                        ButtonAtuh(
                          title: "  SignUp  ",
                          horizontal: 0,
                          colorbackround: Color.fromARGB(255, 97, 4, 66),
                          colorfont: Color.fromARGB(255, 255, 255, 255),
                          onPressed: () async {
                            if (formState.currentState!.validate()) {
                              try {
                                UserCredential usercredential =
                                    await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                  email: email.text,
                                  password: password.text,
                                );
                                FirebaseFirestore.instance
                                    .collection('Users')
                                    .doc(usercredential.user!.email)
                                    .set({'username': username.text});

                                FirebaseAuth.instance.currentUser!
                                    .sendEmailVerification();
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.infoReverse,
                                  animType: AnimType.rightSlide,
                                  title: 'INFO',
                                  desc:
                                      'Please click the activation link we sent to your email',
                                  btnOkOnPress: () {
                                    Navigator.of(context)
                                        .pushReplacementNamed("/login");
                                  },
                                ).show();
                              } on FirebaseAuthException catch (e) {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.error,
                                  animType: AnimType.rightSlide,
                                  title: 'Error',
                                  desc: e.code,
                                  btnOkOnPress: () {},
                                ).show();
                                // if (e.code == 'weak-password') {
                                //   print('The password provided is too weak.');
                                //   AwesomeDialog(
                                //     context: context,
                                //     dialogType: DialogType.error,
                                //     animType: AnimType.rightSlide,
                                //     title: 'Error',
                                //     desc: 'The password provided is too weak.',
                                //     //btnCancelOnPress: () {},
                                //     btnOkOnPress: () {},
                                //   ).show();
                                // } else if (e.code == 'email-already-in-use') {
                                //   print('The account already exists for that email.');
                                //   AwesomeDialog(
                                //     context: context,
                                //     dialogType: DialogType.error,
                                //     animType: AnimType.rightSlide,
                                //     title: 'Error',
                                //     desc:
                                //         'The account already exists for that email.',
                                //     //btnCancelOnPress: () {},
                                //     btnOkOnPress: () {},
                                //   ).show();
                                // }
                              } catch (e) {
                                print(e);
                              }
                            }
                          },
                        ),
                        SizedBox(height: 19),
                        ChangePage(
                            path: '/login',
                            firstText: "Already Have An Account ? ",
                            lastText: "Login")
                      ],
                    )),
              ]),
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
