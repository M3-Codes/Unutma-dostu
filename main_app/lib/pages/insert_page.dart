// ignore_for_file: depend_on_referenced_packages
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:UnutmaDostu/datebase/file_manager.dart';
import '../design/textfont.dart';
import '../design/update and insert/color_picker.dart';
import '../design/update and insert/custom_appbar.dart';
import '../design/update and insert/image_info.dart';
import '../design/update and insert/repeat_time.dart';
import '../design/update and insert/text_field.dart';
import '../design/update and insert/use_calendar.dart';
import '../generated/l10n.dart';
import '../services/notification_service.dart';
import '../services/notification_settings.dart';

class InsertPage extends StatefulWidget {
  const InsertPage({super.key});

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
  FileManager writer = FileManager();
  String _productName = '';
  String _description = '';
  String _place = '';
  String _etkit = '';
  Color _color = Colors.green;
  DateTime _date = DateTime.now();
  String _path1 = '';
  String _path2 = '';
  String _tekrar = '00:00:05';
  String _hour = '00';
  String _minute = '00';
  String _second = '00';

  void _updateTekrar() {
    setState(() {
      _tekrar = '$_hour:$_minute:$_second';
    });
  }

  void _saveData() {
    List<dynamic> row = [
      _productName,
      _description,
      _place,
      "#$_etkit",
      _color.value.toString(),
      _tekrar,
      DateFormat('dd/MM/yyyy/HH:mm:ss').format(_date).toString(),
      _path1,
      _path2
    ];
    writer.writeToFile(row);
  }

  int _interval = 0;

  int _calculateInterval() {
    int hours = int.parse(_hour);
    int minutes = int.parse(_minute);
    int seconds = int.parse(_second);
    if (seconds < 5) {
      seconds = 5;
    }

    setState(() {
      _interval = (hours * 3600) + (minutes * 60) + seconds;
    });
    return _interval;
  }

  void _scheduleNotificationIfNeeded() {
    _calculateInterval();
    NotificationService.showNotification(
      title: _productName,
      body: _etkit,
      scheduled: true,
      interval: _interval,
      payload: {"navigate": "true"},
      actionButtons: [
        NotificationActionButton(
          key: 'check',
          label: S.of(context).checkit,
          actionType: ActionType.SilentAction,
          color: _color,
        ),
      ],
    );
  }

  void _onImageSaved(String fileName, int index) {
    setState(() {
      if (index == 0) {
        _path1 = fileName;
      } else {
        _path2 = fileName;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isSmallScreen = constraints.maxWidth < 600;

        return Scaffold(
          appBar: CustomAppBar(
            onpressed: () {
              NotificationSettings(
                productName: _productName,
                etkit: _etkit,
                color: _color,
                hour: _hour,
                minute: _minute,
                second: _second,
                context: context,
              ).scheduleNotification();
              _saveData();
            },
            title: S.of(context).newitem,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isSmallScreen ? 5.0 : 20.0,
              vertical: isSmallScreen ? 10.0 : 20.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Expanded(flex: 3, child: SizedBox()),
                      Expanded(
                          flex: 17,
                          child: ImageInfos(
                              title: S.of(context).itemAttach,
                              color: const Color(0xFFC1007F),
                              onImageSaved: (fileName) =>
                                  _onImageSaved(fileName, 0))),
                      const Expanded(flex: 3, child: SizedBox()),
                      Expanded(
                          flex: 17,
                          child: ImageInfos(
                              title: S.of(context).placeAttach,
                              color: const Color(0xFFC1007F),
                              onImageSaved: (fileName) =>
                                  _onImageSaved(fileName, 1))),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextFieldWidget(
                    title: S.of(context).itemName,
                    hintText: S.of(context).itemNameH,
                    onChanged: (value) {
                      setState(() {
                        _productName = value;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    title: S.of(context).itemDes,
                    hintText: S.of(context).itemDesH,
                    onChanged: (value) {
                      setState(() {
                        _description = value;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    title: S.of(context).place,
                    hintText: S.of(context).placeAttachH,
                    onChanged: (value) {
                      setState(() {
                        _place = value;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Flexible(
                        flex: 5,
                        child: TextFieldWidget(
                          title: S.of(context).label,
                          hintText: '',
                          onChanged: (value) {
                            setState(() {
                              _etkit = value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Textdesign("${S.of(context).color}  ", 20),
                      const SizedBox(
                        width: 10,
                      ),
                      ColorButton(
                        onColorSelected: (Color value) {
                          _color = value;
                        },
                      ),
                      const SizedBox(
                        width: 35,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const SizedBox(width: 30),
                      RepeatTime(
                        timeType: TimeType.hours,
                        title: S.of(context).repeat,
                        onTextChanged: (value) {
                          _hour = value;
                          _updateTekrar();
                        },
                        onTap: () {},
                      ),
                      RepeatTime(
                        timeType: TimeType.minutes,
                        title: "   :",
                        onTextChanged: (value) {
                          _minute = value;
                          _updateTekrar();
                        },
                        onTap: () {},
                      ),
                      RepeatTime(
                        timeType: TimeType.seconds,
                        title: "   :",
                        onTextChanged: (value) {
                          _second = value;
                          _updateTekrar();
                        },
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const SizedBox(width: 30),
                      Textdesign(S.of(context).date, 20),
                      const SizedBox(width: 25),
                      Flexible(
                        flex: 14,
                        child: DateButton(
                          onDateSelected: (DateTime value) {
                            _date = value;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 80),
                  Row(
                    children: [
                      const SizedBox(width: 75),
                      Flexible(
                        flex: 14,
                        child: Image.asset(
                          "images/yslogo.png",
                          width: 250,
                          height: 65,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
