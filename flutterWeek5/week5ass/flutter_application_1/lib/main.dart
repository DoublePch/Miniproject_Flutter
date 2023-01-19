

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:buddhist_datetime_dateformat_sns/buddhist_datetime_dateformat_sns.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

import  'covid.dart';
void main() {
  runApp(const MyApp());
   Intl.defaultLocale = "th";
   initializeDateFormatting();
}

Covid co = Covid();
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final _username = TextEditingController();
  final _password = TextEditingController();
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _discrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void login() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => NextPage(
            reciveValue: _username.text, reciveValue2: _password.text)));
  }
  void goCovid(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  Covid()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 50),
                child: Column(
                  children: [
                    TextField(
                      controller: _username,
                      decoration: const InputDecoration(
                          labelText: "Username", icon: Icon(Icons.person)),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextField(
                      controller: _password,
                      obscureText: true,
                      decoration: const InputDecoration(
                          labelText: "Password", icon: Icon(Icons.vpn_key)),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  shadowColor: Colors.greenAccent,
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1.0)),
                  // ignore: prefer_const_constructors
                  minimumSize: Size(100, 40), ///////
                ),
                onPressed: () => {login()},
                child: const Text('Login'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  shadowColor: Colors.greenAccent,
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1.0)),
                  // ignore: prefer_const_constructors
                  minimumSize: Size(100, 40), ///////
                ),
                onPressed: () => {goCovid()},
                child: const Text('Go Covid'),
              ),
            ],
          ),
        ),
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
            onPressed: () => {_incrementCounter()},
            child: Icon(Icons.add),
            backgroundColor: Colors.green,
            heroTag: "btn1",
          ),
          FloatingActionButton(
            onPressed: () => {_discrementCounter()},
            child: Icon(Icons.remove),
            backgroundColor: Colors.red,
            heroTag: "btn2",
          ),
        ]));
  }
}

_MyHomePageState data = new _MyHomePageState();

class NextPage extends StatefulWidget {
  String reciveValue, reciveValue2;
  NextPage({Key? key, required this.reciveValue, required this.reciveValue2})
      : super(key: key);

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("NextPage"),
        ),
        body: Center(
            child: Container(
              child: Column(
                children: [
                  Text(
                    "Username : ${widget.reciveValue}",
                    style: const TextStyle(fontSize: 40),
                  ),
                  Text(
                    "Password: ${widget.reciveValue2}",
                    style: const TextStyle(fontSize: 40),
                  ),
                ],
              ),
            )));
  }
}
