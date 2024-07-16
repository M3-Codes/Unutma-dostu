import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../color_options.dart';
import '../design/welcome_signup_login/BG_sl.dart';
import '../design/welcome_signup_login/BG_text.dart';
import '../design/welcome_signup_login/buttonauth.dart';
import '../design/welcome_signup_login/changepage.dart';
import '../design/welcome_signup_login/divider_login.dart';
import '../design/welcome_signup_login/forgetpass.dart';
import '../design/welcome_signup_login/logo_M3_CODE.dart';
import '../design/welcome_signup_login/logo_UD.dart';
import '../design/welcome_signup_login/textform.dart';
import '../design/welcome_signup_login/textformpassword.dart';
import '../generated/l10n.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool _loading = false;

  Future signInWithGoogle() async {
    setState(() {
      _loading = true;
    });
    // Trigger the authentication flow

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      setState(() {
        _loading = false;
      });
      return;
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    setState(() {
      _loading = false;
    });

    // ignore: use_build_context_synchronously
    Navigator.of(context)
        .pushNamedAndRemoveUntil("/homepage", (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final appColor = Provider.of<ColorProvider>(context).appColor;
    return ModalProgressHUD(
      inAsyncCall: _loading,
      child: Scaffold(
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
                child: Column(
                  children: [
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
                            Column(
                              children: [
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
                                InkWell(
                                    onTap: () async {
                                      if (email.text == "") {
                                        AwesomeDialog(
                                          context: context,
                                          dialogType: DialogType.error,
                                          animType: AnimType.rightSlide,
                                          title: 'ُError',
                                          desc: S.of(context).Error,
                                          btnOkOnPress: () {},
                                        ).show();
                                        return;
                                      }
                                      try {
                                        await FirebaseAuth.instance
                                            .sendPasswordResetEmail(
                                                email: email.text);
                                        AwesomeDialog(
                                          // ignore: use_build_context_synchronously
                                          context: context,
                                          dialogType: DialogType.success,
                                          animType: AnimType.rightSlide,
                                          title: 'Success',
                                          desc:
                                              // ignore: use_build_context_synchronously
                                              S.of(context).Success,
                                          btnOkOnPress: () {},
                                        ).show();
                                      } catch (e) {
                                        AwesomeDialog(
                                          // ignore: use_build_context_synchronously
                                          context: context,
                                          dialogType: DialogType.error,
                                          animType: AnimType.rightSlide,
                                          title: 'Error',
                                          // ignore: use_build_context_synchronously
                                          desc: S.of(context).Error1,
                                          btnOkOnPress: () {},
                                        ).show();
                                      }
                                    },
                                    child: const forgetpass()),
                                const SizedBox(height: 18),
                              ],
                            ),
                            ButtonAtuh(
                              title: "  ${S.of(context).login}  ",
                              horizontal: 0,
                              colorbackround: Color.alphaBlend(
                                  Colors.black.withOpacity(0.5), appColor),
                              colorfont:
                                  const Color.fromARGB(255, 255, 255, 255),
                              onPressed: () async {
                                if (formState.currentState!.validate()) {
                                  setState(() {
                                    _loading = true;
                                  });
                                  try {
                                    final credential = await FirebaseAuth
                                        .instance
                                        .signInWithEmailAndPassword(
                                            email: email.text,
                                            password: password.text);
                                    if (credential.user!.emailVerified) {
                                      // ignore: use_build_context_synchronously
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil(
                                              "/homepage", (route) => false);
                                    } else {
                                      AwesomeDialog(
                                        // ignore: use_build_context_synchronously
                                        context: context,
                                        dialogType: DialogType.infoReverse,
                                        animType: AnimType.rightSlide,
                                        title: 'INFO',
                                        desc:
                                            // ignore: use_build_context_synchronously
                                            S.of(context).INFO,
                                        //btnCancelOnPress: () {},
                                        btnOkOnPress: () {},
                                      ).show();
                                    }
                                  } on FirebaseAuthException catch (e) {
                                    AwesomeDialog(
                                      // ignore: use_build_context_synchronously
                                      context: context,
                                      dialogType: DialogType.error,
                                      animType: AnimType.rightSlide,
                                      title: 'Error',
                                      desc: e.code,
                                      btnCancelOnPress: () {},
                                      btnOkOnPress: () {},
                                    ).show();
                                  } finally {
                                    setState(() {
                                      _loading = false;
                                    });
                                  }
                                } else {}
                              },
                            ),
                            const SizedBox(height: 14),
                            const Column(children: [Divider_login()]),
                            const SizedBox(height: 14),
                            ElevatedButton(
                              onPressed: () {
                                signInWithGoogle();
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color.alphaBlend(
                                        Colors.black.withOpacity(0.5),
                                        appColor)),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(
                                        horizontal: 155, vertical: 10)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                              ),
                              child:
                                  Image.asset("images/google.png", width: 30),
                            ),
                            const SizedBox(height: 19),
                            ChangePage(
                                path: '/signup',
                                firstText: S.of(context).pageswitchL,
                                lastText: S.of(context).signup)
                          ],
                        )),
                  ],
                ),
              ),
            ),
            const Logo_M3_CODE_1(path: "images/yslogo.png")
          ],
        ),
      ),
    );
  }
}
