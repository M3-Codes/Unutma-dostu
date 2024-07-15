import 'package:flutter/material.dart';

class UserInfoContent extends StatelessWidget {
  final String username;
  final String email;

  const UserInfoContent({
    Key? key,
    required this.username,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Icon(Icons.person,
            color: Color.fromARGB(255, 147, 1, 98), size: 80),
        Text(username,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        SizedBox(
          width: 250,
          child: Center(
            child: RichText(
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                text: email,
                style: TextStyle(fontSize: 15, color: Colors.grey[900]),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        const SizedBox(
          width: 250,
          child: Divider(thickness: 1, color: Color.fromARGB(255, 147, 1, 98)),
        ),
        Image.asset('images/Logo.png')
      ],
    );
  }
}
