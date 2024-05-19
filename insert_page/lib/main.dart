import 'package:flutter/material.dart';
import 'package:insert_page/design/custom_appbar.dart';
import 'package:insert_page/design/use_calendar.dart';
import 'package:insert_page/design/color_picker.dart';
import 'package:insert_page/design/repeat_time.dart';
import 'design/image_info.dart';
import 'design/text_field.dart';
import 'design/textfont.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isSmallScreen = constraints.maxWidth < 600;
        
        return Scaffold(
          appBar: const CustomAppBar(),
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
                        flex: 5,
                        child: TextFieldWidget(
                          title: 'Etiket',
                          hintText: '#...........',
                        ),
                      ),
                      SizedBox(width: 15,),
                      text_it("Renk  ", 20),
                       SizedBox(width: 10,),
                      
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
                      text_it("Tarih", 20),SizedBox(width: 25),
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
      },
    );
  }
}
