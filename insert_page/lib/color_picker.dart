 
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart'; // Import for ColorPicker
import 'package:google_fonts/google_fonts.dart';

class ColorPickerWidget extends StatelessWidget {
  final ValueChanged<Color> onColorSelected;

  const ColorPickerWidget({super.key, required this.onColorSelected});

  @override
  Widget build(BuildContext context) {
    Color currentColor = Colors.black; // Initial color value

    return ColorPicker( // Use ColorPicker directly from the package
      pickerColor: currentColor,
      onColorChanged: (Color color) {
        currentColor = color;
        onColorSelected(color);
      },
      colorPickerWidth: 300.0,
      pickerAreaHeightPercent: 0.7,
      enableAlpha: true,
      displayThumbColor: true,
      // ignore: deprecated_member_use
      showLabel: true,
      paletteType: PaletteType.hsv,
      pickerAreaBorderRadius: const BorderRadius.only(
        topLeft: Radius.circular(2.0),
        topRight: Radius.circular(2.0),
      ),
    );
  }
}

class ColorPickers extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color color;

  const ColorPickers({super.key, 
    required this.title,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      child: Row(
        children: [
          Text(
            title,
            style: GoogleFonts.rubik(
              textStyle: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(11),
                border: Border.all(color: const Color.fromARGB(255, 255, 255, 255), width: 1),
              ),
              child: const Icon(Icons.colorize, color: Color(0xFFFFFFFF)),
            ),
          ),
        ],
      ),
    );
  }
}
void openColorPicker(BuildContext context) {
  // Show the color picker dialog or widget here
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Renk Seç'),
        content: SingleChildScrollView(
          child: ColorPickerWidget(
            onColorSelected: (Color selectedColor) { 
              // ignore: avoid_print
              print('Selected color: $selectedColor'); // Placeholder for now
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Tamam'),
          ),
        ],
      );
    },
  );
}
