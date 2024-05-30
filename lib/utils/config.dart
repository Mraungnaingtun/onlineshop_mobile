// lib/config.dart
class AppConfig {
  static const String apiBaseUrl = 'http://192.168.100.20:8090/logantapi';
  static const String apiKey = 'your_api_key';
  static const String databaseName = 'app_database';

  static String getApiEndpoint(String endpoint) {
    return '$apiBaseUrl/$endpoint';
  }
}
