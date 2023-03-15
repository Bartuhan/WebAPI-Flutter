import 'dart:core';

import 'package:http/http.dart' as http;

class CategoryApi {
  static Future getCategories() {
    var url = Uri.parse(
        "https://my-json-server.typicode.com/Bartuhan/http_demo/categories");
    return http.get(url);
  }
}
