import 'dart:convert';

import 'package:http/http.dart' as http;

class APIClient {
  static const String baseUrl = 'http://192.168.31.104:8090/logantapi';

  static Future<Map<String, dynamic>> getUser(int userId) async {
    final response = await http.get(Uri.parse('$baseUrl/customers/$userId'));
    
    if (response.statusCode == 200) {
      // Successful response
      final jsonData = response.body;
      final parsedData = jsonDecode(jsonData);
      return parsedData;
    } else {
      // Handle error response
      throw Exception('Failed to load user details: ${response.statusCode}');
    }
  }

  static Future<List<dynamic>> getAllUser() async {
  final response = await http.get(Uri.parse('$baseUrl/customers/all'));
  
  if (response.statusCode == 200) {
    // Successful response
    final jsonData = response.body;
    final parsedData = jsonDecode(jsonData);
    return parsedData; // Assuming parsedData is a list of users
  } else {
    // Handle error response
    throw Exception('Failed to load user details: ${response.statusCode}');
  }
}


}
