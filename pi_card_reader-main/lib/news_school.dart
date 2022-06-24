// ignore_for_file: require_trailing_commas

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:async';
import 'homepage2.dart';
import 'message_list.dart';
import 'message.dart';
import 'homepage.dart';
import 'package:reader_pi_display/news_school.dart';
import 'show_date_time.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:convert';
import 'package:cross_connectivity/cross_connectivity.dart';

var images = [
  "assets/tải xuống (1).jfif",
  "https://docs.flutter.dev/assets/images/dash/dash-fainting.gif",
  "https://picsum.photos/250?image=9",
  "assets/1.jpg",
  "assets/hinh-nen-anime-cho-may-tinh-127-1.jpg",
  "assets/2.jpg",
];

// Slide images
Swiper imageSlider(context) {
  return Swiper(
    autoplay: true,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: new BorderRadius.all(new Radius.circular(25.0)),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(images[index]),
            )),

        // Image.asset(
        //   images[index],
        //   fit: BoxFit.fill,
        // )
      );
    },
    itemCount: images.length,
    viewportFraction: 1,
    pagination: SwiperPagination(),
    control: SwiperControl(),
  );
}

// Nút chuyển màn hình
class FirstRoute extends StatelessWidget {
  const FirstRoute({key});

  @override
  Widget build(BuildContext context) {
    double heightR = MediaQuery.of(context).size.height / 1080;
    double widthR = MediaQuery.of(context).size.width / 1920;
    return Column(
      children: [
        Container(
          child: ElevatedButton(
            child: const Text('Đọc tin tức!'),
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Homepage2()),
              );
            },
          ),
        ),
        Container(
          height: heightR,
          width: widthR,
          child: Greeting(),
        ),
      ],
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Homepage()));
        },
        child: Text('Quẹt thẻ!'),
      ),
    );
  }
}

class Greeting extends StatefulWidget {
  const Greeting({Key? key}) : super(key: key);

  @override
  _GreetingState createState() => _GreetingState();
}

class _GreetingState extends State<Greeting> {
  @override
  initState() {
    super.initState();
    new Timer(const Duration(seconds: 5), onClose);
  }

  @override
  Widget build(BuildContext context) {
    double heightR, widthR;
    heightR = MediaQuery.of(context).size.height / 1080;
    widthR = MediaQuery.of(context).size.width / 1920;
    // var curR = widthR;
    return Scaffold();
  }

  void onClose() {
    Navigator.of(context).pushReplacement(PageRouteBuilder(
        maintainState: true,
        opaque: true,
        pageBuilder: (context, _, __) {
          // return Column(
          //   children: [
          //     Navigator.pop(context),
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => Homepage())
          //     ),
          //   ],
          // );
          return Homepage2();
        },
        transitionDuration: const Duration(seconds: 0),
        transitionsBuilder: (context, anim1, anim2, child) {
          return FadeTransition(
            child: child,
            opacity: anim1,
          );
        }));
  }
}

// Quẹt thẻ thì sang Homepage
class _NFC extends State<MessageList> {
  RemoteNotification Noti = RemoteNotification();
  Widget build(BuildContext context) {
    return Scaffold();
  }

  void initState() {
    super.initState();

    // Future(_showStartDialog);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      Noti = message.notification ?? RemoteNotification();
      String? titleOfNoti = Noti.title ?? '';
      // String? bodyOfNoti = Noti.body ?? '';

      if (titleOfNoti == "NFC_card_info") {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Homepage()),
        );
      }
    });
  }
}
