// ignore_for_file: use_build_context_synchronously, camel_case_types

import 'package:UnutmaDostu/design/textfont.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:UnutmaDostu/design/welcome_signup_login/BG_w.dart';
import 'package:UnutmaDostu/design/welcome_signup_login/logo_M3_CODE.dart';
import 'package:UnutmaDostu/generated/l10n.dart';
import 'package:provider/provider.dart';
import '../../language_provider.dart';
import 'custom_dialog.dart';

class Drawer_h extends StatefulWidget {
  const Drawer_h({super.key});

  @override
  State<Drawer_h> createState() => _Drawer_hState();
}

class _Drawer_hState extends State<Drawer_h> {
  final cuser = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        alignment: Alignment.center,
        children: [
          const BG_w(),
          const Logo_M3_CODE_1(path: "images/ylogo.png"),
          Center(
            child: Column(
              children: [
                const SizedBox(height: 60),
                Container(
                    alignment: Alignment.center,
                    width: 280,
                    height: 317,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(15)),
                    child: StreamBuilder<DocumentSnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('Users')
                            .doc(cuser.email)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final useData = snapshot.data!.data();
                            if (useData != null) {
                              final useDataMap =
                                  useData as Map<String, dynamic>;
                              return Column(
                                children: [
                                  const SizedBox(height: 20),
                                  const Icon(Icons.person,
                                      color: Color.fromARGB(255, 147, 1, 98),
                                      size: 80),
                                  Text(useDataMap['username'],
                                      style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    width: 250,
                                    child: Center(
                                      child: RichText(
                                          overflow: TextOverflow.ellipsis,
                                          text: TextSpan(
                                              text: cuser.email!,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey[900]))),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const SizedBox(
                                      width: 250,
                                      child: Divider(
                                          thickness: 1,
                                          color:
                                              Color.fromARGB(255, 147, 1, 98))),
                                  Image.asset('images/Logo.png')
                                ],
                              );
                            } else {
                              return Column(
                                children: [
                                  const SizedBox(height: 20),
                                  const Icon(Icons.person,
                                      color: Color.fromARGB(255, 147, 1, 98),
                                      size: 80),
                                  //SizedBox(height: 1),
                                  const Text('User',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold)),
                                  //SizedBox(height: 5),
                                  SizedBox(
                                    width: 250,
                                    child: Center(
                                      child: RichText(
                                          overflow: TextOverflow.ellipsis,
                                          text: TextSpan(
                                              text: cuser.email!,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey[900]))),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const SizedBox(
                                      width: 250,
                                      child: Divider(
                                          thickness: 1,
                                          color:
                                              Color.fromARGB(255, 147, 1, 98))),
                                  Image.asset('images/Logo.png')
                                ],
                              );
                            }
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error${snapshot.error}'));
                          }
                          return const Center(
                              child: CircularProgressIndicator());
                        })),
                const SizedBox(height: 70),
                Row(
                  children: [
                    const Expanded(flex: 1, child: SizedBox()),
                    Expanded(
                      flex: 4,
                      child: ListTile(
                        leading: const Icon(Icons.translate_rounded,
                            color: Colors.white, size: 33),
                        title: Text(S.of(context).language,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white)),
                        onTap: () async {
                          _showLanguageDialog(context);
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Expanded(flex: 1, child: SizedBox()),
                    Expanded(
                      flex: 4,
                      child: ListTile(
                        leading: const Icon(Icons.videocam,
                            color: Colors.white, size: 33),
                        title: Text(S.of(context).Demo,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white)),
                        onTap: () async {
                          CustomDialog.showCustomDialog(context);
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Expanded(flex: 1, child: SizedBox()),
                    Expanded(
                      flex: 4,
                      child: ListTile(
                        leading: const Icon(Icons.logout_rounded,
                            color: Colors.white, size: 33),
                        title: Text(S.of(context).signout,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white)),
                        onTap: () async {
                          GoogleSignIn googleSignIn = GoogleSignIn();
                          googleSignIn.disconnect();
                          await FirebaseAuth.instance.signOut();

                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/welcome', (route) => false);
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Expanded(flex: 1, child: SizedBox()),
                    Expanded(
                      flex: 4,
                      child: ListTile(
                        leading: const Icon(Icons.info_outline,
                            color: Colors.white, size: 33),
                        title: Text(S.of(context).about,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white)),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Center(
                                child: AlertDialog(
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Image.asset(
                                          'images/info.png',
                                          width: 30,
                                          height: 30,
                                        ),
                                      ),
                                      const Textdesign(
                                        'About Us',
                                        25,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFC1007F),
                                      ),
                                    ],
                                  ),
                                  content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Textdesign(
                                        '“Coding Solutions,',
                                        20,
                                      ),
                                      const Textdesign(
                                        'Empowering Futures”',
                                        20,
                                      ),
                                      const SizedBox(height: 50.0),
                                      GestureDetector(
                                        onTap: () {
                                          Clipboard.setData(
                                            const ClipboardData(
                                              text: 'm3-codes@hotmail.com',
                                            ),
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  'Email copied to clipboard'),
                                            ),
                                          );
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: Image.asset(
                                                'images/email.png',
                                                width: 25,
                                                height: 25,
                                              ),
                                            ),
                                            const Textdesign(
                                              'Contact us via email at',
                                              18,
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Clipboard.setData(
                                            const ClipboardData(
                                              text: 'm3-codes@hotmail.com',
                                            ),
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  'Email copied to clipboard'),
                                            ),
                                          );
                                        },
                                        child: const Textdesign(
                                          'm3-codes@hotmail.com',
                                          16,
                                          align: TextAlign.center,
                                        ),
                                      ),
                                      const SizedBox(height: 30.0),
                                      GestureDetector(
                                        onTap: () {
                                          Clipboard.setData(
                                            const ClipboardData(
                                              text:
                                                  'https://github.com/M3-Codes/M3-Codes',
                                            ),
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  'GitHub link copied to clipboard'),
                                            ),
                                          );
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: Image.asset(
                                                'images/github.png',
                                                width: 25,
                                                height: 25,
                                              ),
                                            ),
                                            const Textdesign('Our GitHub', 18),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Clipboard.setData(
                                            const ClipboardData(
                                              text:
                                                  'https://github.com/M3-Codes',
                                            ),
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  'GitHub link copied to clipboard'),
                                            ),
                                          );
                                        },
                                        child: const Textdesign(
                                          'https://github.com',
                                          16,
                                          align: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('Close'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Provider.of<LanguageProvider>(context, listen: false)
                      .setLocale(const Locale('en'));
                  Navigator.of(context).pop();
                },
                child: const Text('English'),
              ),
              ElevatedButton(
                onPressed: () {
                  Provider.of<LanguageProvider>(context, listen: false)
                      .setLocale(const Locale('tr'));
                  Navigator.of(context).pop();
                },
                child: const Text('Türkçe'),
              ),
              ElevatedButton(
                onPressed: () {
                  Provider.of<LanguageProvider>(context, listen: false)
                      .setLocale(const Locale('ar'));
                  Navigator.of(context).pop();
                },
                child: const Text('العربية'),
              ),
            ],
          ),
        );
      },
    );
  }
}
