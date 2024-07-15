import 'package:flutter/material.dart';

class DefaultUserInfo extends StatelessWidget {
  final String userEmail;

  const DefaultUserInfo({required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Icon(Icons.person,
            color: Color.fromARGB(255, 147, 1, 98), size: 80),
        const Text('User',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
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
