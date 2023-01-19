import 'dart:convert';

import 'package:miniproject/model/post.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Post>?> getPosts() async {
    final client = http.Client();
    final uri = Uri.parse('http://localhost:8080/stock/getStock');
    final response = await client.get(uri);
    final json = utf8.decode(response.bodyBytes);
    if (response.statusCode == 200) {
      print(json);
      return postFromJson(json);
    }
  }
}
