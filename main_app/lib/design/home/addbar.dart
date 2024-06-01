import 'dart:developer';
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

class _addbarState extends State<addbar> {
  get cuser {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user;
    } else {
      log("Yok!!!!");
    }
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
                title: Textfont('Hoş Geldin ' + useDataMap['username'], 25),
                centerTitle: true,
              );
            } else {
              return AppBar(
                iconTheme: const IconThemeData(color: Colors.white),
                backgroundColor: const Color(0xFFC1007F),
                title: const Textfont("Hoş Geldin User", 25),
                centerTitle: true,
              );
            }
          } else if (snapshot.hasError) {
            return Center(child: Text('Error${snapshot.error}'));
          }
          return const Center(child: CircularProgressIndicator());
        });
  }

  // AppBar(
  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('About as'),
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
  }
}
