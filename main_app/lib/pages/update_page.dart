import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:main_app/datebase/file_reader.dart';
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
  String _path1 = 'images/Araba_Anahtarı 1.jpg';
  String _path2 = 'images/Araba_Anahtarı 2.jpg';
  String _tekrar = '00:00:00';
  String _hour = '00';
  String _minute = '00';
  String _second = '00';

  @override
  void initState() {
    super.initState();
    _productName = widget.database[0];
    _description = widget.database[1];
    _place = widget.database[2];
    _etkit = widget.database[3];
    _color = Color(widget.database[4]);
    _tekrar = widget.database[5];
    _date = DateFormat("dd/MM/yyyy").parse(widget.database[6]);
  }

  void _updateTekrar() {
    setState(() {
      _tekrar = '$_hour:$_minute:$_second';
    });
  }

  void _deleterow() {
    writer.deleteRow(widget.database[0], widget.database[1]);
  }

  void _saveData() {
    List<dynamic> row = [
      _productName,
      _description,
      _place,
      _etkit,
      _color.value.toString(),
      _tekrar,
      DateFormat('dd/MM/yyyy').format(_date).toString(),
      _path1,
      _path2
    ];
    writer.writeToFile(row);
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
              await Future.delayed(Duration(seconds: 2));
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
                  const Row(
                    children: [
                      ImageInfos(
                        title: 'Ürün Eki',
                        color: Color(0xFFC1007F),
                      ),
                      ImageInfos(
                        title: 'Yer Eki',
                        color: Color(0xFFC1007F),
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
