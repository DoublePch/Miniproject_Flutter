import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/Model/Task_Data.dart';
import 'package:todolist/screens/home.dart';
import 'package:todolist/screens/todo_List.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskData>(
      create: (context) => TaskData(),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: Home(),
      ),
    );
  }
}
