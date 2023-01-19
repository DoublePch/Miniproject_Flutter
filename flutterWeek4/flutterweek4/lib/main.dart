import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const Body(),
        appBar: AppBar(
          title: const Text('Week4'),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.cyan,
      ),
    );
  }
}

const TextStyle myStyle = TextStyle(
  color: Colors.white,
  fontSize: 48,
);
const TextStyle myStyle2 = TextStyle(
  color: Colors.white,
  fontSize: 24,
);
const TextStyle myStyle3 = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 24,
);
const TextStyle myStyle4 = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 64,
);
const TextStyle myStyle5 = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.normal,
  fontSize: 8,
);

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text(
            'สถานการณ์ COVID-19',
            style: myStyle,
          ),
          const Text(
            'ในประเทศไทย',
            style: myStyle2,
          ),
          Container(
            alignment: Alignment.center,
            child: const Text(" 12 กรกฏาคม 2565 ", style: myStyle3),
            height: 40,
            width: 400,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(3, 3),
                  ),
                ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 180,
                width: 450,
                margin: const EdgeInsets.all(3),
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 163, 202, 104),
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "หายป่วยวันนี้",
                      style: myStyle2,
                    ),
                    Text(
                      " ",
                      style: myStyle5,
                    ),
                    Text(
                      "+2,115",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 64,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 180,
                width: 450,
                margin: const EdgeInsets.all(3),
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 144, 185, 81),
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "หายป่วยสะสม",
                      style: myStyle2,
                    ),
                    Text(
                      "ตั้งแต่ 1 มกราคม 2565",
                      style: myStyle5,
                    ),
                    Text(
                      "2,325,540",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 64,
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
                height: 180,
                width: 450,
                margin: const EdgeInsets.all(3),
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 205, 98, 108),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "จำนวนผู้ป่วยรักษาตัวในโรงพยาบาล",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const Text(
                      "รายใหม่วันนี้",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const Text(
                      "(By RT-PCR & ATK)",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                    ),
                    const Text(
                      "+1679",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 64,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: const [
                            Text(
                              "ผู้ป่วยในประเทศ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              "+1679",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 35,
                          width: 20,
                          child: VerticalDivider(
                            color: Colors.white,
                          ),
                        ),
                        Column(
                          children: const [
                            Text(
                              "ผู้ป่วยจากต่างประเทศ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              " - ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 180,
                width: 450,
                margin: const EdgeInsets.all(3),
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 210, 124, 112),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "ป่วยสะสม",
                      style: myStyle2,
                    ),
                    Text(
                      "ตั้งแต่ 1 มกราคม 2565",
                      style: myStyle5,
                    ),
                    Text(
                      "2,325,098",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 64,
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
                height: 130,
                width: 300,
                margin: const EdgeInsets.all(2),
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 169, 197, 230),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(20)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "กำลังรักษา",
                      style: myStyle2,
                    ),
                    Text(
                      " ",
                      style: myStyle5,
                    ),
                    Text(
                      "+23,617",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 64,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 130,
                width: 300,
                margin: const EdgeInsets.all(2),
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 154, 153, 200),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "ผู้ป่วยปอดอักเสบ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "รักษาตัวอยู่ในโรงพยาบาล",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "788",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 58,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 130,
                width: 300,
                margin: const EdgeInsets.all(2),
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 127, 127, 127),
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(20)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "เสียชีวิตเพิ่ม",
                      style: myStyle2,
                    ),
                    const Text(
                      "23",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                      ),
                    ),
                    const SizedBox(
                      height: 0,
                      width: 200,
                      child: Divider(
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: const [
                            Text("เสียชีวิตสะสม",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                )),
                            Text("ตั้งแต่ 1 มกราคม 2565",
                                style: TextStyle(
                                  fontSize: 8,
                                  color: Colors.grey,
                                )),
                          ],
                        ),
                        const Text(
                          "9,184",
                          style: TextStyle(
                            fontSize: 25,
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
