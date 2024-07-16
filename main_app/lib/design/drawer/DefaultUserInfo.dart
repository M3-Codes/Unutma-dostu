import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../color_options.dart';

class DefaultUserInfo extends StatelessWidget {
  final String userEmail;

  const DefaultUserInfo({required this.userEmail});

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
        SizedBox(width: 250, child: Divider(thickness: 1, color: appColor)),
        Image.asset('images/Logo$colorName.png'),
      ],
    );
  }
}
