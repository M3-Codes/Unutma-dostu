import 'package:flutter/material.dart';

class SLTextbox extends StatelessWidget {
  final String text;
  final IconData icon;
  const SLTextbox(
    this.text,
    this.icon, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 10), //*** */
        filled: true,
        fillColor: Colors.white,
        labelText: text,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Color(0xFF4F3145))),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Color(0xFF4F3145))),
        prefixIcon: Icon(icon),
      ),
    );
  }
}
