// ignore_for_file: library_private_types_in_public_api, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../color_options.dart';
import '../../generated/l10n.dart';

class DateButton extends StatefulWidget {
  final ValueChanged<DateTime> onDateSelected;
  const DateButton({super.key, required this.onDateSelected});

  @override
  _DateButtonState createState() => _DateButtonState();
}

class _DateButtonState extends State<DateButton> {
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2027),
      cancelText: S.of(context).back,
      confirmText: S.of(context).Done,
      helpText: S.of(context).Selectdate,
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        widget.onDateSelected(_selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final appColor = Provider.of<ColorProvider>(context).appColor;
    return ElevatedButton(
      onPressed: () => _selectDate(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: appColor,
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: appColor, width: 1),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.calendar_today, color: Colors.white),
          const SizedBox(width: 10),
          Text(
            DateFormat('dd/MM/yyyy').format(_selectedDate),
            style: GoogleFonts.rubik(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
