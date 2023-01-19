import 'dart:io';
import 'package:csv/csv.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

final _listviewScrollController = ScrollController();

void main() {
  runApp(const savedFile());
}

class savedFile extends StatelessWidget {
  const savedFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.green,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          color: Colors.green,
        ),
      ),
      title: 'เพิ่มรายชื่อนึกศึกษา',
      home: const App(title: 'เพิ่มรายชื่อนึกศึกษา'),
    );
  }
}

final uID = TextEditingController();
final uName = TextEditingController();
final List<String> id = <String>[];
final List<String> name = <String>[];

//List of List

final List<List<dynamic>> entriesCon = [];

Future<String> getFilePath() async {
  Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
  String appDocumentsPath = appDocumentsDirectory.path;
  String filePath = '$appDocumentsPath/demoTextFile.txt';
  return filePath;
}

void saveFile(csvData) async {
  File file = File(await getFilePath());
  file.writeAsString("${csvData}");
}

class App extends StatefulWidget {
  const App({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<App> createState() => _App();
}

class _App extends State<App> {
  @override
  void initState() {
    loadFile();
    super.initState();
  }

  List<List<dynamic>> entries = [[]];

  void loadFile() async {
    File file = File(await getFilePath());
    String fileContent = await file.readAsString();
    List<List<dynamic>> data = const CsvToListConverter().convert(fileContent);
    setState(() {
      entries = data;
    });
  }

  uIDIncrease() {
    setState(() {
      entries.add([uID.text, uName.text]);
      uID.text = '';
      uName.text = '';
      if (_listviewScrollController.hasClients) {
        _listviewScrollController.animateTo(
            _listviewScrollController.position.maxScrollExtent + 30,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 250));
      }
    });
    String csvData = const ListToCsvConverter().convert(entries);
    saveFile(csvData);
  }

  disCrease(final index) {
    setState(() {
      entries.removeAt([index][index]);
      id.removeAt(index);
      name.removeAt(index);
      print(id.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: entries.length > 0
                ? ListView.builder(
                    controller: _listviewScrollController,
                    itemCount: entries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        color: Colors.green,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${entries[index]}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            IconButton(
                                icon: const Icon(Icons.remove_circle,
                                    color: Colors.white),
                                onPressed: () => disCrease(index))
                          ],
                        ),
                      );
                    },
                  )
                : const Center(child: Text('ไม่มีนักศึกษา')),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(
                    top: 20, bottom: 60, left: 10, right: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: uID,
                      decoration: const InputDecoration(
                          labelText: "รหัสนักศึกษา", icon: Icon(Icons.person)),
                      keyboardType: TextInputType.text,
                    ),
                    TextField(
                      controller: uName,
                      decoration: const InputDecoration(
                          labelText: "ชื่อ - สกุล", icon: Icon(Icons.person)),
                      keyboardType: TextInputType.text,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: uIDIncrease,
        tooltip: 'Increment',
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
