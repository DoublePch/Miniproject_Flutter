import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:buddhist_datetime_dateformat_sns/buddhist_datetime_dateformat_sns.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

import 'savedFile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AppBody(title: 'FaceBook Menu'),
    );
  }
}

add() {}

class AppBody extends StatefulWidget {
  const AppBody({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AppBody> createState() => _AppBody();
}

class _AppBody extends State<AppBody> {
  
  void goSavedFile() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => savedFile()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Color.fromARGB(255, 220, 220, 220),
          child: Column(
            children: [
              Column(
                children: [
                  //Container Menu Top
                  Container(
                    padding: EdgeInsets.only(left: 15, top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Menu',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.search, color: Colors.black),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  //FacebookName
                  Container(
                    padding: EdgeInsets.only(left: 30),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
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
                                    "https://scontent.fbkk12-1.fna.fbcdn.net/v/t39.30808-6/297471144_2874049842892017_5473223148433595146_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeHNpCTo4vDWvUZDFEASHly17InwZeMWbFrsifBl4xZsWj8cMkjEQSFk8_WXfnxlKLeajt0BAZTHAx1RDG-Vq2Am&_nc_ohc=skkUKkawOzYAX80X72I&tn=sMsxtlNxhKDb24dk&_nc_ht=scontent.fbkk12-1.fna&oh=00_AT_6PpxQ6MuFPgQGni9vvHG1MAjtTGuD8wlQT3RotuR4Ag&oe=6317B6F7"),
                              )),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              const Text(
                                'ภูผา ผ่าตัดหัวใจบ่ต้องใช้ยาชา',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              IconButton(
                                icon: const Icon(
                                    Icons.arrow_drop_down_circle_outlined,
                                    color: Colors.black),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  //FaceBook Content
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 45, right: 45),
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                          Icons.cached,
                                          color: Colors.black),
                                      onPressed: () {},
                                    ),
                                    const Text('Memories',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 60, right: 60),
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                          Icons.groups,
                                          color: Colors.black),
                                      onPressed: () {},
                                    ),
                                    const Text('Groups',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 60, right: 60),
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                          Icons.flag,
                                          color: Colors.black),
                                      onPressed: () {},
                                    ),
                                    const Text('Pages',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 60, right: 60),
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                          Icons.group,
                                          color: Colors.black),
                                      onPressed: () {},
                                    ),
                                    const Text('Friends',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 35, right: 35),
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                          Icons.shopping_bag,
                                          color: Colors.black),
                                      onPressed: () {},
                                    ),
                                    const Text('Marketplace',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 27, right: 27),
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                          Icons.ondemand_video,
                                          color: Colors.black),
                                      onPressed: () {},
                                    ),
                                    const Text('Video on Watch',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 60, right: 60),
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                          Icons.save,
                                          color: Colors.black),
                                      onPressed: () {},
                                    ),
                                    const Text('Saved',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 65, right: 65),
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                          Icons.slideshow,
                                          color: Colors.black),
                                      onPressed: () {},
                                    ),
                                    const Text('Reels',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 58, right: 58),
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                          Icons.favorite,
                                          color: Colors.black),
                                      onPressed: () {},
                                    ),
                                    const Text('Dating',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 58, right: 58),
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                          Icons.videogame_asset,
                                          color: Colors.black),
                                      onPressed: () {},
                                    ),
                                    const Text('Gaming',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              SizedBox(
                                width: 370,
                                child: ElevatedButton(
                                  onPressed: (() {
                                    goSavedFile();
                                  }),
                                  child: Text('See More'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Color.fromARGB(
                                        255, 240, 240, 240), // background
                                    onPrimary: Colors.black, // foreground
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
