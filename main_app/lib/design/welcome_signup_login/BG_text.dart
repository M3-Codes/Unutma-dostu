// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: camel_case_types
class BG_text extends StatelessWidget {
  const BG_text({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          flex: 1,
          child: SizedBox(),
        ),
        Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(23),
                      topRight: Radius.circular(23))),
            )),
      ],
    );
  }
}
