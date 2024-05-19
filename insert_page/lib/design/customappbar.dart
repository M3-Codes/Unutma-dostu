import 'package:flutter/material.dart';
import 'package:insert_page/design/textfont.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

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
              MaterialPageRoute(builder: (context) => const HomePagee()),
            );
          },
        ),
      ),
      centerTitle: true,
      title: const text_it(
        'Yeni Ürün',25,
      ),
      actions: [
        Tooltip(
          message: 'Kaydet',
          child: IconButton(
            icon: const Icon(Icons.save, color: Colors.white),
            onPressed: () {
              //TODO
              
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
class HomePagee extends StatelessWidget {
  const HomePagee({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: const Center(
        child: Text('Home Page'),
      ),
    );
  }
}
