import 'package:flutter/material.dart';

class DrawerOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const DrawerOption({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(flex: 1, child: SizedBox()),
        Expanded(
          flex: 4,
          child: ListTile(
            leading: Icon(icon, color: Colors.white, size: 33),
            title: Text(title,
                style: const TextStyle(fontSize: 20, color: Colors.white)),
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}
