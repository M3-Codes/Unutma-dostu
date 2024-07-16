import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../color_options.dart';
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
    final appColor = Provider.of<ColorProvider>(context).appColor;
    String colorName = 'Fuchsia'; // Default color name
    if (appColor == const Color(0xFFd32f2f)) {
      colorName = 'Red';
    } else if (appColor == const Color(0xFF4CAF50)) {
      colorName = 'Green';
    } else if (appColor == const Color(0xFF2196F3)) {
      colorName = 'Blue';
    } else if (appColor == const Color(0xFF00BCD4)) {
      colorName = 'Cyan';
    } else if (appColor == const Color(0xFF9C27B0)) {
      colorName = 'Purple';
    } else if (appColor == const Color(0xFFC1007F)) {
      colorName = 'Fuchsia';
    }

    return Column(
      children: [
        const SizedBox(height: 20),
        Icon(Icons.person, color: appColor, size: 80),
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
        SizedBox(width: 250, child: Divider(thickness: 1, color: appColor)),
        Image.asset('images/Logo$colorName.png'),
      ],
    );
  }
}
