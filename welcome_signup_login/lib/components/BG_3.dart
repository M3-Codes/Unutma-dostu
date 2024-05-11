import 'package:flutter/material.dart';

class BG_3 extends StatelessWidget {
  const BG_3({super.key});

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