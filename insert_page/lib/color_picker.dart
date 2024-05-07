import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart'; // Import for ColorPicker
import 'package:google_fonts/google_fonts.dart';

class ColorPickerWidget extends StatelessWidget {
  final ValueChanged<Color> onColorSelected;

  const ColorPickerWidget({required this.onColorSelected});

  @override
  Widget build(BuildContext context) {
    Color _currentColor = Colors.black; // Initial color value

    return ColorPicker( // Use ColorPicker directly from the package
      pickerColor: _currentColor,
      onColorChanged: (Color color) {
        _currentColor = color;
        onColorSelected(color);
      },
      colorPickerWidth: 300.0,
      pickerAreaHeightPercent: 0.7,
      enableAlpha: true,
      displayThumbColor: true,
      showLabel: true,
      paletteType: PaletteType.hsv,
      pickerAreaBorderRadius: const BorderRadius.only(
        topLeft: const Radius.circular(2.0),
        topRight: const Radius.circular(2.0),
      ),
    );
  }
}

class ColorPickers extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color color;

  const ColorPickers({
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
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: const Icon(Icons.colorize, color: Colors.black),
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
        title: Text('Pick a Color'),
        content: SingleChildScrollView(
          child: ColorPickerWidget(
            onColorSelected: (Color selectedColor) {
              // Update the color and rebuild the widget
              // (You'll need to manage state if ColorPickers is part of a stateful widget)
              print('Selected color: $selectedColor'); // Placeholder for now
            },
          ),
        ),
      );
    },
  );
}
