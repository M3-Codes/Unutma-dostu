import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:UnutmaDostu/datebase/file_reader.dart';
import '../design/insert/color_picker.dart';
import '../design/insert/custom_appbar.dart';
import '../design/insert/image_info.dart';
import '../design/insert/repeat_time.dart';
import '../design/insert/text_field.dart';
import '../design/insert/use_calendar.dart';
import '../design/textfont.dart';

class UpdatePage extends StatefulWidget {
  final List<dynamic> database;
  const UpdatePage({super.key, required this.database});

  @override
  State<UpdatePage> createState() => _InsertPageState();
}

class _InsertPageState extends State<UpdatePage> {
  FileReader writer = FileReader();
  late String _productName;
  late String _description;
  late String _place;
  late String _etkit;
  Color _color = Colors.green;
  DateTime _date = DateTime.now();
  String _path1 = '';
  String _path2 = '';
  String _tekrar = '00:00:00';
  String _hour = '00';
  String _minute = '00';
  String _second = '00';

  @override
  void initState() {
    super.initState();
    _productName = widget.database[0].toString();
    _description = widget.database[1].toString();
    _place = widget.database[2].toString();
    _etkit = widget.database[3];
    _color = Color(widget.database[4]);
    _tekrar = widget.database[5];
    _date = DateFormat('dd/MM/yyyy/HH:mm:ss').parse(widget.database[6]);
    _path1 = widget.database[7];
    _path2 = widget.database[8];
  }

  void _updateTekrar() {
    setState(() {
      _tekrar = '$_hour:$_minute:$_second';
    });
  }

  void _deleterow() {
    writer.deleteRow(widget.database[0], widget.database[1], widget.database[7],
        widget.database[8], _path1, _path2);
  }

  void _saveData() {
    List<dynamic> row = [
      _productName.toString(),
      _description.toString(),
      _place.toString(),
      "#$_etkit",
      _color.value.toString(),
      _tekrar.toString(),
      DateFormat('dd/MM/yyyy/HH:mm:ss').format(_date).toString(),
      _path1,
      _path2
    ];
    writer.writeToFile(row);
  }

  void _onImageSaved(String fileName, int index) {
    setState(() {
      if (index == 0) {
        _path1 = fileName;
      } else if (index == 1) {
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
            onpressed: () async {
              _deleterow();
              await Future.delayed(const Duration(seconds: 2));
              _saveData();
            },
            title: "Ürün güncellemesi",
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
                      ImageInfos(
                        title: 'Ürün Eki',
                        color: const Color(0xFFC1007F),
                        onImageSaved: (fileName) => _onImageSaved(fileName, 0),
                      ),
                      ImageInfos(
                        title: 'Yer Eki',
                        color: const Color(0xFFC1007F),
                        onImageSaved: (fileName) => _onImageSaved(fileName, 1),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextFieldWidget(
                    title: 'Ürün Adı',
                    hintText: _productName,
                    onChanged: (value) {
                      setState(() {
                        _productName = value;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    title: 'Açıklama',
                    hintText: _description,
                    onChanged: (value) {
                      setState(() {
                        _description = value;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    title: 'Yer',
                    hintText: _place,
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
                          title: 'Etiket',
                          hintText: _etkit,
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
                      const Textfont("Renk  ", 20),
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
                        title: 'Tekrar',
                        onTextChanged: (value) {
                          _hour = value;
                          _updateTekrar();
                        },
                        onTap: () {},
                      ),
                      RepeatTime(
                        title: "   :",
                        onTextChanged: (value) {
                          _minute = value;
                          _updateTekrar();
                        },
                        onTap: () {},
                      ),
                      RepeatTime(
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
                      const Textfont("Tarih", 20),
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
