import 'package:dio/dio.dart';
import 'package:shopping_app/models/product_model/product_model.dart';

class ApiService {
  static var client = Dio();

  static Future<List<ProductModel>> fetchProducts() async {
    try {
      var res = await client
          .get("https://fakestoreapi.com/products");
      if (res.statusCode == 200) {
        List<dynamic> jsonData = await res.data;
        print(jsonData);

        return jsonData.take(50).map((e) => ProductModel.fromJson(e)).toList();
      } else {
        throw ("some error occured in fetchProducts else(condtion)");
      }
    } catch (e) {
      print("error occured in api_services fetchProducts =>> $e");
      throw (e);
    }
  }
}
