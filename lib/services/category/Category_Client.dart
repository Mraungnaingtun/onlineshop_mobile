import "package:onlineshopping/services/client/general_client.dart";

class CategoryClient {
static Future<List<String>> getAllCategory() async {
  try {
    final List<Map<String, dynamic>> allData =
        await GeneralClient.getRequest("categories/all");

    List<String> categories = [];
    for (var item in allData) {
      if (item.containsKey('name')) {
        categories.add(item['name']);
      }
    }
    categories = categories.toSet().toList();

    return categories;
  } catch (e) {
    throw Exception('Failed to get categories: $e');
  }
}
}
