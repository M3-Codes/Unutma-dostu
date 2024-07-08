import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:UnutmaDostu/pages/update_page.dart';
import '../../generated/l10n.dart';
import '../../pages/home_page.dart';
import '../textfont.dart';

class Addbar extends StatelessWidget {
  final String title;
  final List<dynamic> data;
  final VoidCallback onpressed;
  const Addbar(
      {required this.title,
      required this.data,
      required this.onpressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFC1007F),
      title: Textdesign(
        title,
        25,
        color: Colors.white,
      ),
      leading: BackButton(
        color: Colors.white,
        onPressed: () => Navigator.pushReplacementNamed(context, '/homepage'),
      ),
      actions: [
        PopupMenuButton(
          iconColor: Colors.white,
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                value: 'delete',
                child: Textdesign(S.of(context).Deleted, 20),
              ),
              PopupMenuItem(
                value: 'edit',
                child: Textdesign(S.of(context).update, 20),
              ),
            ];
          },
          onSelected: (value) {
            if (value == 'delete') {
              _showDelete(context);
            } else if (value == 'edit') {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UpdatePage(
                          database: data,
                        )),
              );
            }
          },
        ),
      ],
    );
  }

  void _showDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).DeletedilogLabel),
          content: Text(S.of(context).DeleteDilogText),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(S.of(context).No),
            ),
            TextButton(
              onPressed: () {
                onpressed();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(S.of(context).deleteText),
                    duration: const Duration(seconds: 3),
                    backgroundColor: const Color(0xFFC1007F),
                  ),
                );
                Future.delayed(const Duration(seconds: 1), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                });
              },
              child: Text(S.of(context).Yes),
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
}
