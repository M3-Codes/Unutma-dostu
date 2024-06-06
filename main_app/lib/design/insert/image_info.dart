// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'dart:developer';
import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:UnutmaDostu/design/textfont.dart';
import 'package:path_provider/path_provider.dart';

class ImageInfos extends StatefulWidget {
  final String title;
  final Color color;
  final ValueChanged<String> onImageSaved;

  const ImageInfos({
    super.key,
    required this.onImageSaved,
    required this.title,
    required this.color,
  });

  @override
  _ImageInfosState createState() => _ImageInfosState();
}

class _ImageInfosState extends State<ImageInfos> {
  File? _image;
  bool imageIsEmpty = false;

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

  String generateUniqueFileName() {
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    final randomNumber = UniqueKey().hashCode;
    return 'image_$currentTime"box"$randomNumber.jpg';
  }

  Future<void> _saveImageToDevice() async {
    if (_image == null) return;
    imageIsEmpty = true;
    final appDir = await getApplicationDocumentsDirectory();
    const folderName = 'my_image';
    final fileName = generateUniqueFileName();

    final directory = Directory('${appDir.path}/$folderName');
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }

    // تقليل حجم الصورة
    final bytes = await _image!.readAsBytes();
    final img.Image? image = img.decodeImage(bytes);
    if (image != null) {
      final resizedImage = img.copyResize(image, width: 800);
      final compressedBytes = img.encodeJpg(resizedImage, quality: 85);

      final savedImage = File('${directory.path}/$fileName')
        ..writeAsBytesSync(compressedBytes);
      log(savedImage.path);
      widget.onImageSaved(fileName);
    }
  }

  void _showImageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Çektiğiniz Resim'),
          content: _image != null
              ? Image.file(_image!)
              : const Text('Uygun Resim Yoktur'),
          actions: [
            TextButton(
              onPressed: () async {
                _saveImageToDevice();
                await Future.delayed(const Duration(milliseconds: 250));
                // ignore: use_build_context_synchronously
                Navigator.of(context).pop();
              },
              child: const Text('Kaydet'),
            ),
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
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
      child: Row(
        children: [
          Textfont(widget.title, 20),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: _getImage,
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: imageIsEmpty ? widget.color : Colors.white,
                borderRadius: BorderRadius.circular(11),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Icon(Icons.add_a_photo,
                  color: imageIsEmpty ? Colors.white : Color(0xFFC1007F)),
            ),
          ),
        ],
      ),
    );
  }
}
