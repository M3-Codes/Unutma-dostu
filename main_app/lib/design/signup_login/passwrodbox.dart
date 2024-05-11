import 'package:flutter/material.dart';

class SLPasswordbox extends StatefulWidget {
  const SLPasswordbox({
    super.key,
  });

  @override
  State<SLPasswordbox> createState() => _SLPasswordboxState();
}

class _SLPasswordboxState extends State<SLPasswordbox> {
  bool _hpass = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _hpass,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 10), //*** */
          filled: true,
          fillColor: Colors.white,
          labelText: "Password",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Color(0xFF4F3145))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Color(0xFF4F3145))),
          prefixIcon: const Icon(Icons.lock),
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
        icon: _hpass
            ? const Icon(Icons.visibility_off)
            : const Icon(Icons.visibility));
  }
}