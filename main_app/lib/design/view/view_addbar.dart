import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:UnutmaDostu/pages/update_page.dart';
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
      title: Textfont(title, 25),
      leading: BackButton(
        color: Colors.white,
        onPressed: () => Navigator.pushReplacementNamed(context, '/homepage'),
      ),
      actions: [
        PopupMenuButton(
          iconColor: Colors.white,
          itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(
                value: 'delete',
                child: Textfont('Delete item', 20),
              ),
              const PopupMenuItem(
                value: 'edit',
                child: Textfont('Update item', 20),
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
              ;
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
                onpressed();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Başarıyla silindi'),
                    duration: Duration(seconds: 3),
                    backgroundColor: Color(0xFFC1007F),
                  ),
                );
                Future.delayed(const Duration(seconds: 1), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                });
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
}
