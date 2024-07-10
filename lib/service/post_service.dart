// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;

class PostServices {
  static Future<List<Map<String, dynamic>>> fetchPosts() async {
    http.Response response = await http.get(
        Uri.parse("https://testapi.thepivot.ng/api/test-feed/posts/test/36"));
    var data = jsonDecode(response.body) as List<dynamic>;
    return data.map((postData) => postData as Map<String, dynamic>).toList();
  }
}