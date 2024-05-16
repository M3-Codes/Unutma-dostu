import 'package:flutter/material.dart';
import '../design/insert/camera_open.dart';
import '../design/insert/color_pick.dart';
import '../design/insert/image_info.dart';
import '../design/insert/repeat_time.dart';
import '../design/insert/text_field.dart';
import '../design/insert/use_calendar.dart';
import '../design/textfont.dart';

CameraOpen op = CameraOpen();

class InsertPage extends StatelessWidget {
  const InsertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Center(
                  child: Textfont("Yeni Ürün", 30),
                ),
              ),
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
              const TextFieldWidget(
                title: 'Ürün Adı',
                hintText: 'Ürünün Adını Yazınız...',
              ),
              const SizedBox(height: 10),
              const TextFieldWidget(
                title: 'Açıklama',
                hintText: 'Açıklama Yazınız...',
              ),
              const SizedBox(height: 10),
              const TextFieldWidget(
                title: 'Yer',
                hintText: 'Yeri Yazınız...',
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Flexible(
                    flex: 3,
                    child: TextFieldWidget(
                      title: 'Etiket',
                      hintText: '#.................',
                    ),
                  ),
                  Textfont("Renk  ", 20),
                  ColorButton(),
                  SizedBox(
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
                    onTap: () {},
                  ),
                  RepeatTime(
                    title: "   :",
                    onTap: () {},
                  ),
                  RepeatTime(
                    title: "   :",
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  SizedBox(width: 30),
                  Textfont("Tarih", 20),
                  // SizedBox(width: 30),
                  Flexible(
                    flex: 14,
                    child: DateButton(),
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
  }
}
