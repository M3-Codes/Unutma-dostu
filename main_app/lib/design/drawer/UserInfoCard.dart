import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'DefaultUserInfo.dart';

class UserInfoCard extends StatelessWidget {
  final User user;

  const UserInfoCard({required this.user});

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
            .doc(user.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final useData = snapshot.data!.data();
            if (useData != null) {
              final useDataMap = useData as Map<String, dynamic>;
              return UserInfo(useDataMap: useDataMap, userEmail: user.email!);
            } else {
              return DefaultUserInfo(userEmail: user.email!);
            }
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  final Map<String, dynamic> useDataMap;
  final String userEmail;

  const UserInfo({required this.useDataMap, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Icon(Icons.person,
            color: Color.fromARGB(255, 147, 1, 98), size: 80),
        Text(useDataMap['username'],
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        SizedBox(
          width: 250,
          child: Center(
            child: RichText(
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                text: userEmail,
                style: TextStyle(fontSize: 15, color: Colors.grey[900]),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        const SizedBox(
            width: 250,
            child:
                Divider(thickness: 1, color: Color.fromARGB(255, 147, 1, 98))),
        Image.asset('images/Logo.png'),
      ],
    );
  }
}
