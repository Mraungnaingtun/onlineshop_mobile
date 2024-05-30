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

  static Future<List<dynamic>> getAllUserPost() async {
  final Uri url = Uri.parse('$baseUrl/customers/all');
  final Map<String, dynamic> body = {
    // Include any necessary parameters
  };

  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(body),
  );

  if (response.statusCode == 200) {
    final jsonData = response.body;
    final parsedData = jsonDecode(jsonData);
    return parsedData;
  } else {
    throw Exception('Failed to load user details: ${response.statusCode}');
  }
}


}
