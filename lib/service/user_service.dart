import 'dart:convert';

import 'package:http/http.dart' as http;

class UserServices {
  static Future<List<Map<String, dynamic>>> fetchPosts() async {
    http.Response response = await http.get(
        Uri.parse("https://testapi.thepivot.ng/api/test-feed/users"));
    var data = jsonDecode(response.body)as List<dynamic>;
    return data.map((userData) => userData as Map<String, dynamic>).toList();
    
  }
}