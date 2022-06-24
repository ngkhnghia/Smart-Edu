import 'package:flutter/material.dart';
import 'dart:ui';
import 'message_list.dart';
import 'message.dart';
import 'show_date_time.dart';
import 'news_school.dart';
import 'firebase_options.dart';

class Homepage2 extends StatefulWidget {
  const Homepage2({Key? key}) : super(key: key);

  @override
  _HomepageState2 createState() => _HomepageState2();
}

class _HomepageState2 extends State<Homepage2> {
  @override
  Widget build(BuildContext context) {
    double heightR, widthR; //v26
    heightR = MediaQuery.of(context).size.height / 1080; //v26
    widthR = MediaQuery.of(context).size.width / 1920; //v26
    var curR = widthR; //v26
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/Background 2.jpg"),
          ),
        ),
        child: Stack(children: [
          Container(
            child: (
                //  logo + ngay thang
                Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // logo
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.only(left: 25 * widthR, top: 10 * heightR),
                      // color: Colors.pink,
                      child: Row(
                        children: [
                          Image.asset(
                            'THCS_CG.png',
                            scale: 5 / curR,
                          ),
                          Text(
                            'Trường THCS Cầu Giấy',
                            style: TextStyle(
                              fontFamily: 'Dosis',
                              fontSize: 48 * widthR,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // Date
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          right: 25 * widthR, top: 10 * heightR),
                      // color: Colors.amber,
                      child: ShowDateTime(),
                    ),
                  ],
                ),
              ],
            )),
          ),

          // Tin tức
          Row(
            children: [
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            left: 60 * widthR, top: 262 * heightR),
                        height: 974 * heightR,
                        width: 1860 * widthR,
                        child: imageSlider(context),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            left: 55 * widthR,
                            top: 295 * heightR,
                            bottom: 25 * heightR,
                            right: 20 * widthR),
                        child: Text(
                          "XX/YY/ZZZZ",
                          style: TextStyle(
                            fontSize: 48 * widthR,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SecondRoute(),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
