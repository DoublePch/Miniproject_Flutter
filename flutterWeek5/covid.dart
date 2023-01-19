// ก่อนใช้ต้องพิมพ์คำสั่ง flutter run --no-sound-null-safety

import 'dart:convert';
import 'dart:convert' as convert;
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:buddhist_datetime_dateformat_sns/buddhist_datetime_dateformat_sns.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

DateTime now = DateTime.now();
String formattedDate = DateFormat('dd / MM / yyyy').format(now);

void main() {
  Intl.defaultLocale = "th";
  initializeDateFormatting();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const Body(),
        appBar: AppBar(
          title: const Text('สถานะการณ์ Covid - 19'),
          backgroundColor: Color.fromARGB(255, 17, 46, 105),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}

const TextStyle myStyle5 = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.normal,
  fontSize: 8,
);

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List _data = [];
  Future<dynamic> getData() async {
    var url = Uri.https(
        'covid19.ddc.moph.go.th', 'api/Cases/today-cases-all', {'q': '{http}'});
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      setState(() {
        _data = jsonResponse;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var onlyBuddhistYear = now.yearInBuddhistCalendar;

    var formatter = DateFormat.yMMMMEEEEd();
    var dateInBuddhistCalendarFormat =
        formatter.formatInBuddhistCalendarThai(now);
    return Center(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(3.0),
            padding: const EdgeInsets.all(3.0),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10,top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "ข้อมูลผู้ติดเชื้อโควิด - 19 ในไทย",
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 17, 46, 105)),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 42, 27, 64),
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      "https://previews.123rf.com/images/mahmud7/mahmud72003/mahmud7200300179/141695633-calendar-icon-flat-illustration-of-calendar-vector-icon-calendar-sign-symbol-%C3%A2%E2%82%AC%E2%80%9C-vector.jpg"),
                                )),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text(
                              // 'วันที่ DateFormat.yMd(${_data[0]['txn_date']})',
                              '$dateInBuddhistCalendarFormat',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
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
          Container(
                  child: const SizedBox(
                    height: 50,
                    width: 350,
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                ),
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 42, 27, 64),
                                  shape: BoxShape.rectangle,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        "https://previews.123rf.com/images/mahmud7/mahmud72003/mahmud7200300179/141695633-calendar-icon-flat-illustration-of-calendar-vector-icon-calendar-sign-symbol-%C3%A2%E2%82%AC%E2%80%9C-vector.jpg"),
                                  )),
                            ),
                            Container(
                              child: const Text(" ข้อมูลวันนี้",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  const Text("ติดเชื้อเพิ่ม (รักษาใน รพ.)",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  Text(
                                    '+${NumberFormat("#,###").format(_data[0]['new_case'])}',
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 229, 94, 70)),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Column(
                                children: [
                                  const Text("รักษาหายเพิ่ม",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  Text(
                                    '+${NumberFormat("#,###").format(_data[0]['new_recovered'])}',
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 119, 171, 113)),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Column(
                                children: [
                                  const Text("เสียชีวิตเพิ่ม",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  Text(
                                    '${NumberFormat("#,###").format(_data[0]['new_death'])}',
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 75, 75, 75)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: const SizedBox(
                    height: 50,
                    width: 350,
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 42, 27, 64),
                                  shape: BoxShape.rectangle,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        "https://previews.123rf.com/images/mahmud7/mahmud72003/mahmud7200300179/141695633-calendar-icon-flat-illustration-of-calendar-vector-icon-calendar-sign-symbol-%C3%A2%E2%82%AC%E2%80%9C-vector.jpg"),
                                  )),
                            ),
                            Container(
                              child: const Text(" ข้อมูลสะสมตั้งแต่ปี 2563",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              width: 350,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 229, 94, 70),
                              ),
                              child: Column(
                                children: [
                                  const Text("จำนวนผู้ติดเชื้อสะสม",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                  Text(
                                    '+${NumberFormat("#,###").format(_data[0]['total_case'])}',
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 350,
                              margin: EdgeInsets.only(top: 10),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 119, 171, 113),
                              ),
                              child: Column(
                                children: [
                                  const Text("จำนวนผู้รักษาหายสะสม",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                  Text(
                                    '+${NumberFormat("#,###").format(_data[0]['total_recovered'])}',
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 350,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 75, 75, 75),
                              ),
                              margin: EdgeInsets.only(top: 10),
                              child: Column(
                                children: [
                                  const Text("จำนวนผู้เสียชีวิตสะสม",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                  Text(
                                    '${NumberFormat("#,###").format(_data[0]['total_death'])}',
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
