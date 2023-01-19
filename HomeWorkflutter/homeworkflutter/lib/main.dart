import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Body(),
        backgroundColor: Color.fromARGB(255, 72, 160, 183),
      ),
    );
  }
}

const TextStyle myStyle = TextStyle(
  color: Colors.white,
  fontSize: 48,
);

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 170,
                width: 140,
                margin: const EdgeInsets.only(left: 20.0),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 42, 27, 64),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/logoeuro.jpg'))),
                child: Row(
                  children: const [
                    Text(
                      " ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 30.0),
                    child: Column(
                      children: [
                        Column(
                          children: const [
                            Text(
                              "โปรแกรมการแข่งขัน",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              "ฟุตบอลชิงแชมป์แห่งชาติยุโรป 2020 ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 54, 124, 140),
                              ),
                              padding: const EdgeInsets.only(
                                  left: 4, right: 4, top: 0, bottom: 0),
                              child: const Text(
                                "รอบ 16 ทีมสุดท้าย",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
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
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 22,left: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "เสาร์ 26 มิถุนายน",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 90,
                      margin: const EdgeInsets.only(left: 50.0),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 42, 27, 64),
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://st.depositphotos.com/3248189/4493/v/450/depositphotos_44936121-stock-illustration-welsh-dragon-flag.jpg"),
                          )),
                    ),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 500,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 54, 124, 140),
                              border: Border.all(
                                color: Colors.white,
                                width: 1,
                              )),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                "เวลส์",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 105, 202, 192),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                    ),
                                child: const Text(
                                  "23.00 น.",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              const Text(
                                "เดนมาร์ก",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 90,
                          margin: const EdgeInsets.only(left: 0.0),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 42, 27, 64),
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Flag_of_Denmark.svg/1280px-Flag_of_Denmark.svg.png"),
                              )),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
           Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 22,left: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "อาทิตย์ 27 มิถุนายน (คืนวันเสาร์ที่ 26 มิ.ย)",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 90,
                      margin: const EdgeInsets.only(left: 50.0),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 42, 27, 64),
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://upload.wikimedia.org/wikipedia/en/thumb/0/03/Flag_of_Italy.svg/255px-Flag_of_Italy.svg.png"),
                          )),
                    ),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 500,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 54, 124, 140),
                              border: Border.all(
                                color: Colors.white,
                                width: 1,
                              )),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                "อิตาลี",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 105, 202, 192),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                    ),
                                child: const Text(
                                  "02.00 น.",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              const Text(
                                "ออสเตรีย",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 90,
                          margin: const EdgeInsets.only(left: 0.0),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 42, 27, 64),
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Flag_of_Austria.svg/225px-Flag_of_Austria.svg.png"),
                              )),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
           Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 22,left: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "อาทิตย์ 27 มิถุนายน",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 90,
                      margin: const EdgeInsets.only(left: 50.0),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 42, 27, 64),
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Flag_of_the_Netherlands.svg/2560px-Flag_of_the_Netherlands.svg.png"),
                          )),
                    ),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 500,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 54, 124, 140),
                              border: Border.all(
                                color: Colors.white,
                                width: 1,
                              )),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                "เนเธอร์แลนด์",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 105, 202, 192),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                    ),
                                child: const Text(
                                  "23.00 น.",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              const Text(
                                "สาธารณรัฐเช็ค",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 90,
                          margin: const EdgeInsets.only(left: 0.0),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 42, 27, 64),
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Flag_of_the_Czech_Republic.svg/2560px-Flag_of_the_Czech_Republic.svg.png"),
                              )),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
           Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 22,left: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "จันทร์ 28 มิถุนายน (คืนวันอาทิตย์ที่ 27 มิ.ย)",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 90,
                      margin: const EdgeInsets.only(left: 50.0),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 42, 27, 64),
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Flag_of_Belgium.svg/2363px-Flag_of_Belgium.svg.png"),
                          )),
                    ),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 500,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 54, 124, 140),
                              border: Border.all(
                                color: Colors.white,
                                width: 1,
                              )),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                "เบลเยียม",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 105, 202, 192),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                    ),
                                child: const Text(
                                  "02.00 น.",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              const Text(
                                "โปรตุเกส",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 90,
                          margin: const EdgeInsets.only(left: 0.0),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 42, 27, 64),
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Portugal.svg/2560px-Flag_of_Portugal.svg.png"),
                              )),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
           Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 22,left: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "จันทร์ 28 มิถุนายน",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 90,
                      margin: const EdgeInsets.only(left: 50.0),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 42, 27, 64),
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Flag_of_Croatia.svg/2560px-Flag_of_Croatia.svg.png"),
                          )),
                    ),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 500,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 54, 124, 140),
                              border: Border.all(
                                color: Colors.white,
                                width: 1,
                              )),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                "โครเอเชีย",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 105, 202, 192),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                    ),
                                child: const Text(
                                  "23.00 น.",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              const Text(
                                "สเปน",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 90,
                          margin: const EdgeInsets.only(left: 0.0),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 42, 27, 64),
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    "https://media.istockphoto.com/vectors/vector-flag-of-spain-proportion-23-spanish-national-bicolor-flag-vector-id967321166?k=20&m=967321166&s=612x612&w=0&h=yLqa0s16OZSNNRAFbNw6EOCKCsRE2aYRhjekTiITdX4="),
                              )),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
           Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 22,left: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "อังคาร 29 มิถุนายน (คืนวันจันทร์ที่ 28 มิ.ย)",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 90,
                      margin: const EdgeInsets.only(left: 50.0),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 42, 27, 64),
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://upload.wikimedia.org/wikipedia/en/thumb/c/c3/Flag_of_France.svg/640px-Flag_of_France.svg.png"),
                          )),
                    ),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 500,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 54, 124, 140),
                              border: Border.all(
                                color: Colors.white,
                                width: 1,
                              )),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                "ฝรั่งเศส",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 105, 202, 192),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                    ),
                                child: const Text(
                                  "02.00 น.",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              const Text(
                                "สวิตเซอร์แลนด์",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 90,
                          margin: const EdgeInsets.only(left: 0.0),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 42, 27, 64),
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    "https://media.istockphoto.com/vectors/switzerland-flag-vector-graphic-rectangle-swiss-flag-illustration-vector-id1221518229?k=20&m=1221518229&s=170667a&w=0&h=sGzjeB-hmOA2fVR81F_UiVL3hDYxA6RKjzEDg2iW-mE="),
                              )),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
           Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 22,left: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "อังคาร 29 มิถุนายน",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 90,
                      margin: const EdgeInsets.only(left: 50.0),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 42, 27, 64),
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Flag_of_England.svg/2560px-Flag_of_England.svg.png"),
                          )),
                    ),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 500,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 54, 124, 140),
                              border: Border.all(
                                color: Colors.white,
                                width: 1,
                              )),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                "อังกฤษ",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 105, 202, 192),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                    ),
                                child: const Text(
                                  "23.00 น.",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              const Text(
                                "เยอรมันนี",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 90,
                          margin: const EdgeInsets.only(left: 0.0),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 42, 27, 64),
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Flag_of_Germany.svg/2560px-Flag_of_Germany.svg.png"),
                              )),
                        )
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


