import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:view_page/design/textfont.dart';

// ignore: camel_case_types
class addbar extends StatelessWidget {
  final String title;
  const addbar({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFC1007F),
      title: const TitleTextFont("Araba Anahtari"),
      leading: BackButton(
        color: Colors.white,
        onPressed: () => log("Tamam"),
      ),
      actions: [
        PopupMenuButton(
          iconColor: Colors.white,
          itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(
                value: 'delete',
                child: Textfont('Delete item'),
              ),
              const PopupMenuItem(
                value: 'edit',
                child: Textfont('Update item'),
              ),
            ];
          },
          onSelected: (value) {
            if (value == 'delete') {
              _showDelete(context);
            } else if (value == 'edit') {
              log('Tamam');
            }
          },
        ),
      ],
    );
  }
}

void _showDelete(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Confirm deletion"),
        content: const Text("Are you sure you want to delete this item?"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text("NO"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text("Yes"),
          ),
        ],
      );
    },
  ).then((value) {
    if (value != null && value) {
      log("Tamam");
    }
  });
}
