import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insert_page/color_pick.dart';
import 'package:insert_page/repeat_time.dart';
import 'image_info.dart';
import 'text_field.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    int hour = 0;
    int minute = 0;
    int second = 0;
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          // Wrap Column with SingleChildScrollView
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Center(
                  child: Text(
                    "Yeni Ürün",
                    style: GoogleFonts.rubik(
                      textStyle: const TextStyle(
                        fontSize: 30,
                        color: Color(0xFFC1007F),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  ImageInfos(
                    title: 'Ürün Eki',
                    onTap: () => log("Ürün imgesi Butonu şuan çalışmamakta"),
                    color: const Color(0xFF00FFF0),
                  ),
                  ImageInfos(
                    title: 'Yer Eki',
                    onTap: () => log("Yer imgesi Butonu şuan çalışmamakta"),
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
              Row(
                children: [
                  const Flexible(
                    flex: 3,
                    child: TextFieldWidget(
                      title: 'Etiket',
                      hintText: '#.................',
                    ),
                  ),
                  Text(
                    "Renk  ",
                    style: GoogleFonts.rubik(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const ColorButton(),
                  const SizedBox(
                    width: 35,
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                
                children: [
                  const SizedBox(width: 35),
                  RepeatTime(
                    title: 'Tekrar  ',
                    onTap: () {
                      hour++;
                      print('Hour: $hour');
                    },
                  ),
                  RepeatTime(
                    title: "",
                    onTap: () {
                      minute++;
                      print('Minute: $minute');
                    },
                  ),
                  RepeatTime(
                    title: "",
                    onTap: () { 
                      print('Second: $second');
                    },
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
