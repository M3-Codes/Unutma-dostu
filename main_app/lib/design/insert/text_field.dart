import 'package:flutter/material.dart';
import 'package:UnutmaDostu/design/textfont.dart';

class TextFieldWidget extends StatelessWidget {
  final String title;
  final String hintText;
  final ValueChanged<String>? onChanged;
  const TextFieldWidget(
      {super.key,
      required this.title,
      required this.hintText,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
      child: Row(
        children: [
          Textfont(title, 20),
          SizedBox(
            width: title == "Yer" ? 70 : 20,
          ),
          SizedBox(
            width: title == "Etiket" ? 5 : 0,
          ),
          SizedBox(
            width: title == "Ürün Adı" ? 5 : 0,
          ),
          Expanded(
            child: TextField(
              enabled: true,
              onChanged: onChanged,
              maxLength: title == "Etiket" ? 5 : null,
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
                prefix: title == "Etiket" ? const Text('#') : null,
                counterText: "",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
