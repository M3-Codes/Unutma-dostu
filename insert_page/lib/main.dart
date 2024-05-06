import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Center(
                child: Text(
                  "Yeni Ürün",
                  style: GoogleFonts.rubik(
                    textStyle: const TextStyle(
                      fontSize: 30,
                      color: Color(0xFFC1007F),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                _buildImageInfo(
                  title: 'Ürün Eki',
                  onTap: () => print("Ürün imgesi Butonu şuan çalışmamakta"),
                  color: const Color(0xFF00FFF0),
                ),
                _buildImageInfo(
                  title: 'Yer Eki   ',
                  onTap: () => print("Yer imgesi Butonu şuan çalışmamakta"),
                  color: const Color(0xFFF6FA32),
                ),
              ],
            ),
            _buildTextField(
              title: 'Ürün Adı',
              hintText: 'Ürünün Adını Yazınız...',
            ),
            _buildTextField(
              title: 'Açıklama',
              hintText: 'Açıklama Yazınız...',
            ),
            _buildTextField(
              title: 'Yer',
              hintText: 'Yeri Yazınız...',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageInfo({
    required String title,
    required VoidCallback onTap,
    required Color color,
  }) {
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

  Widget _buildTextField({
    required String title,
    required String hintText,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
      child: Row(
        children: [
          Text(
            title,
            style: GoogleFonts.rubik(
              textStyle: const TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: TextField(
              enabled: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11.0),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                contentPadding: const EdgeInsets.all(10.0),
                hintText: hintText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
