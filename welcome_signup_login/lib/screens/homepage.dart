import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:welcome_signup_login/components/BG_w.dart';
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
                  actions: [
                    IconButton(
                        onPressed: () async {
                          GoogleSignIn googleSignIn = GoogleSignIn();
                          googleSignIn.disconnect();
                          await FirebaseAuth.instance.signOut();
                          Navigator.of(context)
                              .pushNamedAndRemoveUntil('/', (route) => false);
                        },
                        icon: const Icon(Icons.exit_to_app))
                  ],
                ),
                drawer: const Drawer_h(),
                body: const Stack(
                  alignment: Alignment.center,
                  children: [
                    BG_w(),
                    Logo_UD(),
                    Logo_M3_CODE_1(path: "images/ylogo.png")
                  ],
                ),
              );
            } else {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Welcome ' + 'User'),
                  actions: [
                    IconButton(
                        onPressed: () async {
                          GoogleSignIn googleSignIn = GoogleSignIn();
                          googleSignIn.disconnect();
                          await FirebaseAuth.instance.signOut();
                          Navigator.of(context)
                              .pushNamedAndRemoveUntil('/', (route) => false);
                        },
                        icon: const Icon(Icons.exit_to_app))
                  ],
                ),
                drawer: const Drawer_h(),
                body: const Stack(
                  alignment: Alignment.center,
                  children: [
                    BG_w(),
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
