// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

// ignore: camel_case_types
class TextForm_Password extends StatefulWidget {
  final TextEditingController ccontroller;
  final String? Function(String?)? validator;

  const TextForm_Password(
      {super.key, required this.ccontroller, required this.validator});

  @override
  State<TextForm_Password> createState() => _TextForm_PasswordState();
}

// ignore: camel_case_types
class _TextForm_PasswordState extends State<TextForm_Password> {
  bool _hpass = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.ccontroller,
      obscureText: _hpass,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 16, horizontal: 10), //*** */
          filled: true,
          fillColor: Colors.white,
          labelText: S.of(context).password,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Color(0xFF4F3145))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Color(0xFF4F3145))),
          prefixIcon: Icon(Icons.lock),
          suffixIcon: togglePassword()),
    );
  }

  Widget togglePassword() {
    return IconButton(
        onPressed: () {
          setState(() {
            _hpass = !_hpass;
          });
        },
        icon: _hpass ? Icon(Icons.visibility_off) : Icon(Icons.visibility));
  }
}
