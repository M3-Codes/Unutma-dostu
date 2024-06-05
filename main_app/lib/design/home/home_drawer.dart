// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:UnutmaDostu/design/welcome_signup_login/BG_w.dart';
import 'package:UnutmaDostu/design/welcome_signup_login/logo_M3_CODE.dart';

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
          BG_w(),
          Logo_M3_CODE_1(path: "images/ylogo.png"),
          Center(
            child: Column(
              children: [
                SizedBox(height: 60),
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
                                  SizedBox(height: 20),
                                  Icon(Icons.person,
                                      color: Color.fromARGB(255, 147, 1, 98),
                                      size: 80),
                                  Text(useDataMap['username'],
                                      style: TextStyle(
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
                                  SizedBox(height: 10),
                                  SizedBox(
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
                                  SizedBox(height: 20),
                                  Icon(Icons.person,
                                      color: Color.fromARGB(255, 147, 1, 98),
                                      size: 80),
                                  //SizedBox(height: 1),
                                  Text('User',
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
                                  SizedBox(height: 10),
                                  SizedBox(
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
                SizedBox(height: 70),
                Row(
                  children: [
                    Expanded(flex: 1, child: SizedBox()),
                    Expanded(
                      flex: 3,
                      child: ListTile(
                        leading:
                            Icon(Icons.home, color: Colors.white, size: 33),
                        title: Text('HOME',
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
                SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(flex: 1, child: SizedBox()),
                    Expanded(
                      flex: 4,
                      child: ListTile(
                        leading: Icon(Icons.logout_rounded,
                            color: Colors.white, size: 33),
                        title: Text('SIGN OUT',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                        onTap: () async {
                          GoogleSignIn googleSignIn = GoogleSignIn();
                          googleSignIn.disconnect();
                          await FirebaseAuth.instance.signOut();
                          Navigator.of(context)
                              .pushNamedAndRemoveUntil('/', (route) => false);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(flex: 1, child: SizedBox()),
                    Expanded(
                      flex: 4,
                      child: ListTile(
                        leading: Icon(Icons.info_outline,
                            color: Colors.white, size: 33),
                        title: Text('ABOUT US',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('About us'),
                                content: const Text('M3 Code sunar'),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('Ok'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
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
