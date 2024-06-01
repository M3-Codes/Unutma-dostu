// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../textfont.dart';

class Imagesbutton extends StatelessWidget {
  final String text;
  final String path;

  const Imagesbutton({required this.text, required this.path, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final appDir = await getApplicationDocumentsDirectory();
        const folderName = 'my_image'; // اسم المجلد
        final directory = Directory('${appDir.path}/$folderName');
        // ignore: use_build_context_synchronously
        _showImage(context, '${directory.path}/$path', text);
      },
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: Colors.black87, width: 3))),
      child: Textfont(text, 20),
    );
  }
}

void _showImage(BuildContext context, String imagePath, String text) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(text),
      content: Image.file(File(imagePath)), // Use the imagePath parameter
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('close'),
        ),
      ],
    ),
  );
}
