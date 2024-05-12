// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DateButton extends StatefulWidget {
  const DateButton({super.key});

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
      cancelText: 'Geri',
      confirmText: 'Tamam',
      helpText: 'Tarih Seç',
      
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _selectDate(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFC1007F),
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Color(0xFFC1007F), width: 1),
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
