import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

final List<String> entries = <String>[
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P'
];
final List<int> colorCodes = <int>[
  600,
  500,
  100,
  600,
  500,
  100,
  600,
  500,
  100,
  600,
  500,
  100,
  600,
  500,
  100,
  600
];

String word = "You have pushed the button this many times:";
String wordTH = 'คุณกดปุ่มนี้ ครั้งที่:';
String transs = '';

dynamic wordd = '';
dynamic output = '';
int itemCount = 20;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  GoogleTranslator translator = GoogleTranslator();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void translate() {
    translator.translate(word, to: 'th').then((output) {
      setState(() {
        wordd = output;
      });
    });
  }

  void backTranslate() {
    setState(() {
      wordd = word;
    });
  }

  void trans() {
    setState(() {
      transs = wordTH;
    });
  }

  void basktrans() {
    setState(() {
      transs = word;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // body: ListView.builder(
      //   padding: const EdgeInsets.all(8),
      //   itemCount: entries.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return Container(
      //       height: 50,
      //       color: Colors.amber[colorCodes[index]],
      //       child: Center(child: Text('Entry ${entries[index]}')),
      //     );
      //   },
      // ),
      body: itemCount > 0
          ? ListView.builder(
              itemCount: itemCount,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: Colors.green,
                  child: ListTile(
                    title: Text('Item ${index + 1}',style: TextStyle(color: Colors.white),),
                  ),
                );
              },
             
            )
          : const Center(child: Text('No items')),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => {backTranslate()},
            child: Icon(Icons.arrow_back),
            backgroundColor: Colors.black,
            heroTag: "btn3",
          ),
          const SizedBox(
            width: 100,
          ),
          FloatingActionButton(
            onPressed: () => {translate()},
            child: Icon(Icons.translate),
            backgroundColor: Colors.red,
            heroTag: "btn1",
          ),
          const SizedBox(
            width: 100,
          ),
          FloatingActionButton(
            onPressed: () => {_incrementCounter()},
            child: Icon(Icons.add),
            backgroundColor: Colors.green,
            heroTag: "btn2",
          ),
        ],
      ),
    );
  }
}
