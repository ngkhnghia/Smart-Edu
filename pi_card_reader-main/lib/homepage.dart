import 'package:flutter/material.dart';
import 'dart:ui';
import 'message_list.dart';
import 'show_date_time.dart';
import 'news_school.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
            // you can change line 26 into "fit: BoxFit.fill"
            fit: BoxFit
                .fill, //v26 It's fill properties in last ver, for keeping ratio when scaling windows
            scale: 1 / curR, //v26
            image: AssetImage("assets/wallpaper.jpg"),
          ),
        ),
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.only(
                        left: 95 * widthR, top: 50 * heightR), //v26
                    child: Row(
                      children: [
                        Image.asset(
                          'logo.png',
                          scale: 5 / curR,
                        ), //v26
                        Text(
                          '  Trường Tiểu học Phan Chu Trinh', // Sửa tên trường, hãy sửa dòng này
                          style: TextStyle(
                            fontFamily: 'Dosis', fontSize: 48 * widthR,
                            fontWeight: FontWeight.w400, //v26
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ))
              ],
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                          right: 100 * widthR, top: 65 * heightR), //v26
                      //color: Colors.white,
                      child: ShowDateTime(),
                    ),
                  ),
                  // This expands the row element vertically because it's inside a column
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(right: 100 * widthR), //v26
                      //color: Colors.white,
                      child: MessageList(),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(top: 50 * heightR), //v26
                    padding: EdgeInsets.only(right: 100 * widthR), //v26
                    child: Text(
                      '" Tri thức là chìa khóa mở cửa tương lai"',
                      style: TextStyle(
                        fontFamily: 'iCielBambola', fontSize: 52 * curR,
                        fontWeight: FontWeight.w200, //v26
                        color: Colors.white,
                      ),
                    ),
                  )),
                ]),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FirstRoute(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
