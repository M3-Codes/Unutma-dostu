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

class InsertPage extends StatefulWidget {
  const InsertPage({super.key});

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
  FileReader writer = FileReader();
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
              _saveData();
            },
            title: "Yeni Ürün",
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
                    hintText: 'Ürünün Adını Yazınız...',
                    onChanged: (value) {
                      setState(() {
                        _productName = value;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    title: 'Açıklama',
                    hintText: 'Açıklama Yazınız...',
                    onChanged: (value) {
                      setState(() {
                        _description = value;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    title: 'Yer',
                    hintText: 'Yeri Yazınız...',
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
