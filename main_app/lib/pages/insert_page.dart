import 'package:flutter/material.dart';
import 'package:main_app/datebase/file_reader.dart';
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
  String _color = '';
  String _date = '';
  String _path1 = 'images/Araba_Anahtarı 1.jpg';
  String _path2 = 'images/Araba_Anahtarı 2.jpg';

  String _tekrar = '00:00:00';

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
      _etkit,
      _color.toString(),
      _date,
      _tekrar,
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
            onpressed: () {
              _saveData();
            },
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
                    hintText: 'Ürünün Adını Yazınız...',
                    onChanged: (value) {
                      setState(() {
                        _productName = value; // حفظ النص المدخل في المتغير
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    title: 'Açıklama',
                    hintText: 'Açıklama Yazınız...',
                    onChanged: (value) {
                      setState(() {
                        _description = value; // حفظ النص المدخل في المتغير
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    title: 'Yer',
                    hintText: 'Yeri Yazınız...',
                    onChanged: (value) {
                      setState(() {
                        _place = value; // حفظ النص المدخل في المتغير
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
                          hintText: '#...........',
                          onChanged: (value) {
                            setState(() {
                              _etkit = value; // حفظ النص المدخل في المتغير
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
                          _color = value.toString();
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
                            _date = value.toString();
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
