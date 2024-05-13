// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ImageInfos extends StatefulWidget {
  final String title;
  final Color color;

  const ImageInfos({
    super.key,
    required this.title,
    required this.color,
  });

  @override
  _ImageInfosState createState() => _ImageInfosState();
}

class _ImageInfosState extends State<ImageInfos> {
  File? _image;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
        _showImageDialog();
      } else {
        print('Resim seçilmedi');
      }
    });
  }

  void _showImageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Çektiğiniz Resim'),
          content: _image != null ? Image.file(_image!) : const Text('Uygun Resim Yoktur'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Geri'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      child: Row(
        children: [
          Text(
            widget.title,
            style: GoogleFonts.rubik(
              textStyle: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: _getImage,
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.circular(11),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: const Icon(Icons.add_a_photo, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
