import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: const MyBody(),
      appBar: AppBar(
        title: const Text('First Application by Phupha Chaiyadee'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.green,
    ));
  }
}

//การสร้าง Method ย่อยๆ ไว้เรียกใช้
const TextStyle myStyle = TextStyle(
  color: Colors.white,
  fontSize: 48,
);

class MyBody extends StatelessWidget {
  const MyBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int i, j;
    return Center(
        child: Container(
            child: Column(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            for (i = 1; i <= 10; i++)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  for (j = 1; j <= 10; j++)
                    Text(
                      '${j + (i * 10) - 10} ',
                      style: myStyle,
                    ),
                ],
              ),
          ],
        ),
      ],
    )));
  }
}
