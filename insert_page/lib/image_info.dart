import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageInfos extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color color;

  const ImageInfos({super.key, 
    required this.title,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      child: Row(
        children: [
          Text(
            title,
            style: GoogleFonts.rubik(
              textStyle: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(11),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: const Icon(Icons.attach_file, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
