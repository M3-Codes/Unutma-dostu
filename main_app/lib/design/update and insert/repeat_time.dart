// ignore_for_file: library_private_types_in_public_api

import 'package:UnutmaDostu/design/textfont.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

enum TimeType { hours, minutes, seconds }

class RepeatTime extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final ValueChanged<String> onTextChanged;
  final TimeType timeType;

  const RepeatTime({
    super.key,
    required this.title,
    required this.onTap,
    required this.onTextChanged,
    required this.timeType,
  });

  @override
  _RepeatTimeState createState() => _RepeatTimeState();
}

class _RepeatTimeState extends State<RepeatTime> {
  late TextEditingController _controller;
  late int minValue;
  late int maxValue;
  double _cumulativeDrag = 0.0;
  final _dragThreshold = 30.0;

  @override
  void initState() {
    super.initState();
    // ignore: unrelated_type_equality_checks
    if (TimeType.seconds == widget.timeType) {
      _controller = TextEditingController(text: '05');
    } else {
      _controller = TextEditingController(text: '00');
    }

    _controller.addListener(() {
      widget.onTextChanged(_controller.text);
    });

    switch (widget.timeType) {
      case TimeType.hours:
        minValue = 0;
        maxValue = 23;
        break;
      case TimeType.minutes:
        minValue = 0;
        maxValue = 59;
        break;
      case TimeType.seconds:
        minValue = 5;
        maxValue = 59;
        break;
    }
  }

  void _updateValue(int increment) {
    int currentValue = int.tryParse(_controller.text) ?? minValue;
    int newValue = (currentValue + increment) % (maxValue + 1);

    if (newValue < minValue) {
      newValue = maxValue;
    } else if (newValue > maxValue) {
      newValue = minValue;
    }

    _controller.text = newValue.toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    int currentValue = int.tryParse(_controller.text) ?? minValue;
    int previousValue =
        (currentValue - 1 < minValue) ? maxValue : currentValue - 1;
    int nextValue = (currentValue + 1 > maxValue) ? minValue : currentValue + 1;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      child: Row(
        children: [
          Textdesign(widget.title, 20),
          SizedBox(width: widget.title == "  :" ? 10 : 20),
          SizedBox(width: widget.title == S.of(context).repeat ? 10 : 0),
          GestureDetector(
            onVerticalDragUpdate: (details) {
              _cumulativeDrag += details.delta.dy;
              if (_cumulativeDrag <= -_dragThreshold) {
                _updateValue(1);
                _cumulativeDrag = 0.0;
              } else if (_cumulativeDrag >= _dragThreshold) {
                _updateValue(-1);
                _cumulativeDrag = 0.0;
              }
            },
            onTap: widget.onTap,
            child: Container(
              width: 40,
              height: 105,
              decoration: BoxDecoration(
                color: const Color(0x00FFFFFF),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFC1007F), width: 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    previousValue.toString().padLeft(2, '0'),
                    style:
                        const TextStyle(fontSize: 12, color: Color(0xFFF66EC6)),
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    width: 40,
                    child: TextField(
                      controller: _controller,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      enabled: false,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFC1007F)),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    nextValue.toString().padLeft(2, '0'),
                    style: const TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 246, 110, 198)),
                  ),
                ],
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
