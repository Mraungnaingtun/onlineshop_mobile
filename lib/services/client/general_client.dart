import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:onlineshopping/utils/config.dart';

class GeneralClient {
  static Future<List<Map<String, dynamic>>> getRequest(String endpoint) async {
    try {
      final response =
          await http.get(Uri.parse(AppConfig.getApiEndpoint(endpoint)));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        final List<Map<String, dynamic>> parsedData = jsonData
            .map((json) => Map<String, dynamic>.from(json))
            .toList();
        return parsedData;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
