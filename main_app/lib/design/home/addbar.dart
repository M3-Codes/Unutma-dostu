// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:developer';
import 'package:UnutmaDostu/generated/l10n.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../textfont.dart';

// ignore: camel_case_types
class addbar extends StatefulWidget {
  const addbar({super.key});

  @override
  State<addbar> createState() => _addbarState();
}

// ignore: camel_case_types
class _addbarState extends State<addbar> {
  final TextEditingController _usernameController = TextEditingController();
  String? username;

  get cuser {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user;
    } else {
      log("Yok!!!!");
    }
  }

  void _showUsernameDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Textdesign(S.of(context).entername, 20),
          content: TextField(
            controller: _usernameController,
            decoration: InputDecoration(hintText: S.of(context).enternameH),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(S.of(context).Cancel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(S.of(context).Done),
              onPressed: () {
                setState(() {
                  username = _usernameController.text;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

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
              return AppBar(
                iconTheme: const IconThemeData(color: Colors.white),
                backgroundColor: const Color(0xFFC1007F),
                title: Textdesign(
                  '${S.of(context).welcome2} ' + useDataMap['username'],
                  25,
                  color: Colors.white,
                ),
                centerTitle: true,
              );
            } else if (username != null && username!.isNotEmpty) {
              FirebaseFirestore.instance
                  .collection('Users')
                  .doc(cuser.email)
                  .set({'username': username});
              return AppBar(
                iconTheme: const IconThemeData(color: Colors.white),
                backgroundColor: const Color(0xFFC1007F),
                flexibleSpace: Center(
                  child: Textdesign("${S.of(context).welcome2} $username", 25,
                      color: Colors.white),
                ),
              );
            } else {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _showUsernameDialog(context);
              });

              return AppBar(
                backgroundColor: const Color(0xFFC1007F),
                flexibleSpace: Center(
                  child: Textdesign(
                    "${S.of(context).welcome2} User",
                    25,
                    color: Colors.white,
                  ),
                ),
              );
            }
          } else if (snapshot.hasError) {
            return Center(child: Textdesign('Error${snapshot.error}', 12));
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
