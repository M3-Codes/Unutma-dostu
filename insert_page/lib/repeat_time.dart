import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RepeatTime extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const RepeatTime({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  _RepeatTimeState createState() => _RepeatTimeState();
}

class _RepeatTimeState extends State<RepeatTime> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: '00');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 1.0),
      child: Row(
        children: [
          Text(
            widget.title,
            style: GoogleFonts.rubik(
              textStyle: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(width: 30),
          GestureDetector(
            onTap: widget.onTap,
            child: Container(
              width: 50,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0x00FFFFFF), // Buradaki renk sabit
                borderRadius: BorderRadius.circular(11),
                border: Border.all(color: const Color(0xFFC1007F), width: 1),
              ),
              child: Center(
                child: TextField(
                  controller: _controller,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    // Buraya istediğiniz ekstra doğrulama veya mantık ekleyebilirsiniz
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}