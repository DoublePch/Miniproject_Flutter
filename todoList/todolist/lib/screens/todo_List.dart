import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todolist/Model/Task_Data.dart';
import 'package:todolist/Model/addTaskScreen.dart';
import 'package:todolist/Model/task_title.dart';
import 'package:todolist/services/database.dart';
import 'package:provider/provider.dart';

import '../Model/Models.dart';

class todo_List extends StatefulWidget {
  const todo_List({Key? key}) : super(key: key);

  @override
  State<todo_List> createState() => _todo_ListState();
}

class _todo_ListState extends State<todo_List> {
  List<Task>? tasks;

  getTask() async {
    tasks = await DatabaseService.getTasks();
    Provider.of<TaskData>(context, listen: false).tasks = tasks!;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getTask();
  }

  @override
  Widget build(BuildContext context) {
    return tasks == null
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(
                  "Todo List (${Provider.of<TaskData>(context).tasks.length})"),
              centerTitle: true,
              backgroundColor: Colors.grey,
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Consumer<TaskData>(
                builder: (context, tasksData, child) {
                  return ListView.builder(
                      itemCount: tasksData.tasks.length,
                      itemBuilder: (context, index) {
                        Task task = tasksData.tasks[index];
                        return TaskTile(
                          task: task,
                          tasksData: tasksData,
                        );
                      });
                },
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.grey,
              child: const Icon(
                Icons.add,
              ),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const AddTaskScreen();
                    });
              },
            ),
          );
  }
}
