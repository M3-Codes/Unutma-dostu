import 'package:flutter/material.dart';
import '../../pages/home_page.dart';
import '../textfont.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onpressed;
  final String title;
  const CustomAppBar({super.key, required this.title, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFC1007F),
      leading: Tooltip(
        message: 'Geri',
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
      ),
      centerTitle: true,
      title: Textfont(
        title,
        25,
      ),
      actions: [
        Tooltip(
          message: 'Kaydet',
          child: IconButton(
            icon: const Icon(Icons.save, color: Colors.white),
            onPressed: () {
              onpressed();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Başarıyla kaydedildi'),
                  duration: Duration(seconds: 3),
                  backgroundColor: Color(0xFFC1007F),
                ),
              );
              Future.delayed(Duration(seconds: 2), () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              });
            },
          ),
        ),
      ],
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// This is a placeholder for the new page you want to navigate to.
// Replace this with your actual new page widget.

