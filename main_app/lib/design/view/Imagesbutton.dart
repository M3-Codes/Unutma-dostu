// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../../generated/l10n.dart';
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
        const folderName = 'my_image';
        final directory = Directory('${appDir.path}/$folderName');
        String imagePath = '${directory.path}/$path';

        if (path.isEmpty || !(await File(imagePath).exists())) {
          imagePath = 'images/nofoto.png';
        }
        // ignore: use_build_context_synchronously
        _showImage(context, imagePath, text);
      },
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: Colors.black87, width: 3))),
      child: Textdesign(text, 20),
    );
  }
}

void _showImage(BuildContext context, String imagePath, String text) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(text),
      content: imagePath.startsWith('images/')
          ? Image.asset(imagePath) // Use Image.asset for assets
          : Image.file(File(imagePath)), // Use Image.file for files
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(S.of(context).close),
        ),
      ],
    ),
  );
}
