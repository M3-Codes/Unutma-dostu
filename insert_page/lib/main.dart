import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:insert_page/design/use_calendar.dart';
import 'package:insert_page/design/color_pick.dart';
import 'package:insert_page/design/repeat_time.dart';
import 'design/image_info.dart';
import 'design/text_field.dart';
import 'design/camera_open.dart';
import 'design/textfont.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

CameraOpen op = CameraOpen();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 20),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: Center(
                        child: text_it("Yeni Ürün", 30),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        ImageInfos(
                          title: 'Ürün Eki',
                          onTap: () =>
                              log("Ürün imgesi Butonu şuan çalışmamakta"),
                          color: const Color(0xFF00FFF0),
                        ),
                        ImageInfos(
                          title: 'Yer Eki',
                          onTap: () {
                            op.openit();
                          },
                          color: const Color(0xFFF6FA32),
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
                        text_it("Renk  ", 20),
                        ColorButton(),
                        SizedBox(
                          width: 35,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const SizedBox(width: 35),
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
                        SizedBox(width: 35),
                        text_it("Tarih", 20),
                        SizedBox(width: 30),
                        Flexible(
                          flex: 14,
                          child: DateButton(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 80),
                    Row(
                      children: [
                        const SizedBox(width: 70),
                        Flexible(
                          flex: 14,
                          child: Image.asset(
                            "images/m3code.jpg",
                            width: 250,
                            height: 65,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
