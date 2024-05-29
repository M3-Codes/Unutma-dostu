import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:welcome_signup_login/components/home_drawer.dart';
import 'package:welcome_signup_login/components/logo_M3_CODE.dart';
import 'package:welcome_signup_login/components/logo_UD.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _homepageState();
}

class _homepageState extends State<Homepage> {
  final cuser = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(cuser.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final useData = snapshot.data!.data();
            if (useData != null) {
              final useDataMap = useData as Map<String, dynamic>;
              return Scaffold(
                appBar: AppBar(
                  title: Text('Welcome ' + useDataMap['username']),
                  centerTitle: true,
                ),
                drawer: const Drawer_h(),
                body: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            Color.fromARGB(255, 248, 183, 183),
                            Color.fromARGB(255, 157, 113, 142),
                          ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                    ),
                    Logo_UD(),
                    Logo_M3_CODE_1(path: "images/ylogo.png")
                  ],
                ),
              );
            } else {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Welcome ' + 'User'),
                  centerTitle: true,
                ),
                drawer: const Drawer_h(),
                body: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            Color.fromARGB(255, 248, 183, 183),
                            Color.fromARGB(255, 157, 113, 142),
                          ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                    ),
                    Logo_UD(),
                    Logo_M3_CODE_1(path: "images/ylogo.png")
                  ],
                ),
              );
            }
          } else if (snapshot.hasError) {
            return Center(child: Text('Error${snapshot.error}'));
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
