import 'package:flutter/material.dart';

class DrawerMenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const DrawerMenuItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(flex: 1, child: SizedBox()),
        Expanded(
          flex: 4,
          child: ListTile(
            leading: Icon(icon, color: Colors.white, size: 33),
            title: Text(text,
                style: const TextStyle(fontSize: 20, color: Colors.white)),
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}
