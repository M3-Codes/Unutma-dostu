import 'package:UnutmaDostu/design/textfont.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:UnutmaDostu/design/welcome_signup_login/BG_w.dart';
import 'package:UnutmaDostu/design/welcome_signup_login/logo_M3_CODE.dart';

// ignore: camel_case_types
class Drawer_h extends StatefulWidget {
  const Drawer_h({super.key});

  @override
  State<Drawer_h> createState() => _Drawer_hState();
}

// ignore: camel_case_types
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
                                  //cuser.email!.length >= 25 ? h = 338;
                                  //overflow: TextOverflow.ellipsis,
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
                                  // Text(cuser.email!,
                                  //     style: TextStyle(fontSize: 15)),
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
                      flex: 3,
                      child: ListTile(
                        leading: const Icon(Icons.home,
                            color: Colors.white, size: 33),
                        title: const Text('HOME',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                        onTap: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/homepage', (route) => false);
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
                        title: const Text('SIGN OUT',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                        onTap: () async {
                          GoogleSignIn googleSignIn = GoogleSignIn();
                          googleSignIn.disconnect();
                          await FirebaseAuth.instance.signOut();
                          // ignore: use_build_context_synchronously
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
                        title: const Text('ABOUT US',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
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
                                        ), // Buraya logo için path'i verin
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
                                              text: 'https://github.com',
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
                                              text: 'https://github.com',
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
}
