<<<<<<< HEAD
import 'package:flutter/material.dart';
=======
import 'package:flutter/material.dart'; 
>>>>>>> 52b36de960d7ab1bd3a192ec0431605ffd1fe4b7
import 'package:insert_page/design/textfont.dart';

class TextFieldWidget extends StatelessWidget {
  final String title;
  final String hintText;

  const TextFieldWidget({
    super.key,
    required this.title,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
      child: Row(
        children: [
          text_it(title, 20),
          const SizedBox(width: 20),
          Expanded(
            child: TextField(
              enabled: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11.0),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                contentPadding: const EdgeInsets.all(10.0),
                hintText: hintText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
