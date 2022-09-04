import 'package:http/http.dart' as http;
import 'package:ProductList/models/product.dart';

class RemoteServices {
  static var client = http.Client();
  static String baseUrl = 'https://fakestoreapi.com/products';
  //static String baseUrl = 'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline';

  static Future<List<Product>> fetchProducts() async {
    var response = await client.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}
