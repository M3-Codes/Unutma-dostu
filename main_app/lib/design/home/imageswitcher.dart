// ignore_for_file: library_private_types_in_public_api
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import '../../datebase/file_reader.dart';
import '../../pages/view_page.dart';
import '../../services/notification_service.dart';

class ImageSwitcher extends StatefulWidget {
  final int index;
  const ImageSwitcher(this.index, {super.key});

  @override
  _ImageSwitcherState createState() => _ImageSwitcherState();
}

class _ImageSwitcherState extends State<ImageSwitcher> {
  late List<bool> list = [];
  late List<String> etkitlist = [];
  late List database = [];
  late List<String> time1;
  late List<String> time2;
  late List<String> tarih;
  late List<dynamic> data;

  AssetImage firstImage = const AssetImage('images/box2.jpg');
  AssetImage secondImage = const AssetImage('images/box1.jpg');
  bool isSwitched = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    FileReader fileReader = FileReader();
    List<bool> fetchedList = await fileReader.doluMU();
    List<String> etkit = await fileReader.etiktler();
    database = await fileReader.readFromNewFile();
    setState(() {
      list = fetchedList;
      etkitlist = etkit;
      if (list[(widget.index) - 1]) {
        time1 = database[widget.index][5].toString().split(':');
        tarih = database[widget.index][6].toString().split('/');
        data = database[widget.index];
      }
    });

    _scheduleNotificationIfNeeded();
  }

  int _interval = 0;

  int _calculateInterval() {
    int hours = int.parse(time1[0]);
    int minutes = int.parse(time1[1]);
    int seconds = int.parse(time1[2]);
    if (seconds < 5) {
      seconds = 5;
    }

    setState(() {
      _interval = (hours * 3600) + (minutes * 60) + seconds;
    });
    return _interval;
  }

  void _scheduleNotificationIfNeeded() {
    if (list.isNotEmpty && list[widget.index - 1]) {
      _calculateInterval();
      NotificationService.showNotification(
        title: list[(widget.index) - 1]
            ? database[widget.index][0].toString()
            : "ürün",
        body: list[(widget.index) - 1]
            ? database[widget.index][3].toString()
            : "ürün",
        scheduled: true,
        interval: _interval,
        payload: {"navigate": "true"},
        actionButtons: [
          NotificationActionButton(
            key: 'check',
            label: 'Göz Atın',
            actionType: ActionType.SilentAction,
            color: list[(widget.index) - 1]
                ? Color(database[widget.index][4])
                : Colors.green,
          ),
        ],
      );
    }
  }

  void switchImage() {
    if (list[widget.index - 1]) {
      setState(() {
        isSwitched = !isSwitched;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty || widget.index - 1 >= list.length) {
      return const CircularProgressIndicator();
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ViewPage(index: widget.index),
                ),
              );
            },
            child: IgnorePointer(
              ignoring: !list[(widget.index) - 1],
              child: Image(
                image: list[(widget.index) - 1] ? secondImage : firstImage,
                width: 80,
                height: 80,
              ),
            ),
          ),
          Text(
            list[(widget.index) - 1] ? etkitlist[widget.index - 1] : " ",
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
