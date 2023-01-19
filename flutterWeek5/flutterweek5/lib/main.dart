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

class CovidDATA {
  String txnData = '';
  int new_case = 0;
  int totalcase = 0;
  int new_case_excludeabroad = 0;
  int total_case_excludeabroad = 0;
  int new_death = 0;
  int total_death = 0;
  int new_recovered = 0;
  int total_recovered = 0;
  int update_Time = 0;
  String update_date = "";
  List<int> sum = <int>[];
}

CovidDATA c = new CovidDATA();

void main() {
  Intl.defaultLocale = "th";
  initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: MyBody(),
        backgroundColor: Color.fromARGB(255, 27, 45, 65),
      ),
    );
  }
}

class MyBody extends StatelessWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getData();
    return FutureBuilder(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const LinearProgressIndicator();
        } else {
          return const MyWidget();
        }
      },
    );
  }
}

var uri = "https://covid19.ddc.moph.go.th/api/Cases/today-cases-all";
Future<dynamic> getData() async {
  var response = await http.get(Uri.parse(uri));
  Map<String, dynamic> receive =
      jsonDecode(response.body.substring(1, response.body.length - 1));
  c.new_case = receive["new_case"];
  c.totalcase = receive["total_case"] - 2223435;
  c.total_recovered = receive['total_recovered'] - 2168494;
  c.txnData = receive["update_date"];
  c.new_case_excludeabroad = receive["new_case_excludeabroad"];
  c.total_case_excludeabroad = receive["total_case_excludeabroad"];
  c.new_death = receive["new_death"];
  c.total_death = receive["total_death"] - 21698;
  c.new_recovered = receive["new_recovered"];
  c.update_date = receive["update_date"];

  print(c.new_case);
}

const TextStyle myStyle = TextStyle(
  color: Colors.white,
  fontSize: 20,
);
const TextStyle myStyle2 = TextStyle(
  color: Colors.white,
  fontSize: 20,
);
const TextStyle myStyle3 = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 20,
);
const TextStyle myStyle4 = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 20,
);
const TextStyle myStyle5 = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.normal,
  fontSize: 10,
);

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  DateTime dateTime = new DateTime.now();

  @override
  Widget build(BuildContext context) {
    var formatter = new NumberFormat("#,###,###");

    return Center(
        child: Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'สถานการณ์ COVID-19',
                style: myStyle,
              ),
              const Text(
                'ในประเทศไทย',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Container(
                alignment: Alignment.center,
                height: 5,
                width: 180,
                margin: const EdgeInsets.all(0),
                padding: const EdgeInsets.all(0),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(248, 236, 241, 70),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            child: const Text('lklxfdf',
                style: TextStyle(
                    color: Color.fromARGB(255, 237, 237, 237), fontSize: 15)),
          )
        ]),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 120,
              width: 360,
              margin: const EdgeInsets.all(3),
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 169, 165, 202),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "หายป่วยวันนี้",
                    style: myStyle2,
                  ),
                  Text(
                    '+${formatter.format(c.new_recovered)}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 140,
              width: 170,
              margin: const EdgeInsets.all(3),
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 47, 85, 150),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "ผู้ป่วยในโรงพยาบาล",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const Text(
                    "รายใหม่วันนี้",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  Container(
                    child: const Text('hgjhjhjhj',
                        style: TextStyle(
                            color: Color.fromARGB(255, 237, 237, 237),
                            fontSize: 15)),
                  )
                ],
              ),
            ),
            Container(
              height: 140,
              width: 170,
              margin: const EdgeInsets.all(3),
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 221, 89, 103),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "ผู้ป่วยสะสม",
                    style: myStyle2,
                  ),
                  Text(
                    '+${formatter.format(c.totalcase)}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 170,
              margin: const EdgeInsets.all(3),
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 45, 115, 167),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "ติดเชื้อเพิ่มวันนี้",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const Text(
                    "จำนวนผู้ป่วย",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    '+${formatter.format(c.new_case)}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Column(
                      children: const [
                        Text(
                          "",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ]),
                ],
              ),
            ),
            Container(
              height: 100,
              width: 170,
              margin: const EdgeInsets.all(3),
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 210, 124, 112),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "ผู้ป่วยปอดอักเสบ",
                    style: myStyle2,
                  ),
                  Text(
                    " 995 ราย",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 170,
              margin: const EdgeInsets.all(3),
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 102, 163, 217),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "ผู้ป่วยปอดอักเสบ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const Text(
                    "(กำลังรักษาใน รพ.)",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  const Text(
                    "13 ราย",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Column(
                      children: const [
                        Text(
                          "",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ]),
                ],
              ),
            ),
            Container(
              height: 100,
              width: 170,
              margin: const EdgeInsets.all(3),
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 127, 127, 127),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "เสียชีวิตเพิ่ม",
                    style: myStyle2,
                  ),
                  Text(
                    '+${formatter.format(c.total_death)}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        )
      ],
    ));
  }
}
