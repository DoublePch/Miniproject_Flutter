import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todolist/Model/Models.dart';
import 'package:todolist/services/gobal.dart';

class DatabaseService {
  static Future<Task> addTask(String title) async {
    Map data = {
      "title": title,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + '/add');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(utf8.decode(response.bodyBytes));
    String utf82 = utf8.decode(response.bodyBytes);
    Map responseMap = jsonDecode(utf82);
    Task task = Task.fromMap(responseMap);
    return task;
  }

  static Future<List<Task>> getTasks() async {
    var url = Uri.parse(baseURL);
    http.Response response = await http.get(
      url,
      headers: headers,
    );
    print(utf8.decode(response.bodyBytes));
    String utf82 = utf8.decode(response.bodyBytes);
    List responseList = jsonDecode(utf82);
    List<Task> tasks = [];
    for (Map taskMap in responseList) {
      Task task = Task.fromMap(taskMap);
      tasks.add(task);
    }
    return tasks;
  }

  static Future<http.Response> updateTask(int id) async {
    var url = Uri.parse(baseURL + '/update/$id');
    http.Response response = await http.put(
      url,
      headers: headers,
    );
    print(response.body);
    return response;
  }

  static Future<http.Response> deleteTask(int id) async {
    var url = Uri.parse(baseURL + '/delete/$id');
    http.Response response = await http.delete(url, headers: headers);
    print(response.body);
    return response;
  }
}
