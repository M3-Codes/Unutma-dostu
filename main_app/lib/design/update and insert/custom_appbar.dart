import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../color_options.dart';
import '../../generated/l10n.dart';
import '../../pages/home_page.dart';
import '../textfont.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onpressed;
  final String title;
  const CustomAppBar({super.key, required this.title, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    final appColor = Provider.of<ColorProvider>(context).appColor;
    return AppBar(
      backgroundColor: appColor,
      leading: Tooltip(
        message: S.of(context).back,
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
      title: Textdesign(
        title,
        25,
        color: Colors.white,
      ),
      actions: [
        Tooltip(
          message: S.of(context).Save,
          child: IconButton(
            icon: const Icon(Icons.save, color: Colors.white),
            onPressed: () {
              onpressed();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(S.of(context).SaveText),
                  duration: const Duration(seconds: 3),
                  backgroundColor: appColor,
                ),
              );
              Future.delayed(const Duration(seconds: 2), () {
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
