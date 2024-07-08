// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../design/welcome_signup_login/BG_sl.dart';
import '../design/welcome_signup_login/BG_text.dart';
import '../design/welcome_signup_login/buttonauth.dart';
import '../design/welcome_signup_login/changepage.dart';
import '../design/welcome_signup_login/logo_M3_CODE.dart';
import '../design/welcome_signup_login/logo_UD.dart';
import '../design/welcome_signup_login/textform.dart';
import '../design/welcome_signup_login/textformpassword.dart';
import '../generated/l10n.dart';

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
          const BG_sl(),
          const Logo_UD(),
          const BG_text(),
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
                              hinttext: S.of(context).username,
                              ccontroller: username,
                              icon: Icons.person,
                              validator: (val) {
                                if (val == "") {
                                  return S.of(context).filed;
                                }
                                return null;
                              }),
                          const SizedBox(height: 18),
                          TextForm(
                              hinttext: S.of(context).email,
                              ccontroller: email,
                              icon: Icons.email,
                              validator: (val) {
                                if (val == "") {
                                  return S.of(context).filed;
                                }
                                return null;
                              }),
                          const SizedBox(height: 18),
                          TextForm_Password(
                              ccontroller: password,
                              validator: (val) {
                                if (val == "") {
                                  return S.of(context).filed;
                                }
                                return null;
                              }),
                          const SizedBox(height: 43),
                        ]),
                        ButtonAtuh(
                          title: "  ${S.of(context).signup}  ",
                          horizontal: 0,
                          colorbackround: const Color.fromARGB(255, 97, 4, 66),
                          colorfont: const Color.fromARGB(255, 255, 255, 255),
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
                                  desc: S.of(context).INFO,
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
                              } catch (e) {
                                log(e.toString());
                              }
                            }
                          },
                        ),
                        const SizedBox(height: 19),
                        ChangePage(
                            path: '/login',
                            firstText: S.of(context).pageswitchS,
                            lastText: S.of(context).login)
                      ],
                    )),
              ]),
            ),
          ),
          const Logo_M3_CODE_1(
            path: "images/yslogo.png",
          )
        ],
      ),
    );
  }
}
