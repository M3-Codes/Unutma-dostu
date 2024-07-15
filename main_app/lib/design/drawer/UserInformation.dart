import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'UserInfoContent.dart';

class UserInformation extends StatelessWidget {
  final User? currentUser;

  const UserInformation({Key? key, required this.currentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 280,
      height: 317,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
      ),
      child: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(currentUser?.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final useData = snapshot.data!.data();
            final useDataMap = useData as Map<String, dynamic>;
            return UserInfoContent(
              username: useDataMap['username'],
              email: currentUser!.email!,
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error${snapshot.error}'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
