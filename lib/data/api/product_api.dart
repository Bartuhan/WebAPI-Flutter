import 'package:http/http.dart' as http;

class ProductApi {
  static Future getProducts() {
    var url = Uri.parse(
        "https://my-json-server.typicode.com/Bartuhan/http_demo/products");
    return http.get(url);
  }

  static Future getProductsByCategoryId(int categoryId) {
    var url = Uri.parse(
        "https://my-json-server.typicode.com/Bartuhan/http_demo/products?categoryId=$categoryId");
    return http.get(url);
  }
}
