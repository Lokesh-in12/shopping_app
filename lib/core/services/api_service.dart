import 'package:dio/dio.dart';
import 'package:shopping_app/src/models/product_model/product_model.dart';
import 'package:shopping_app/core/utils/helpers/exceptions.dart';
import 'package:shopping_app/src/views/widgets/custom_dialogue_err.dart';

class ApiService {
  static var client = Dio();

  static Future<List<ProductModel>> fetchProducts(ctx) async {
    try {
      var res = await client.get("https://fakestoreapi.com/products");
      List<dynamic> jsonData = await res.data;
      return jsonData.take(50).map((e) => ProductModel.fromJson(e)).toList();
    } catch (e) {
      final errorMessage = DioExceptions.fromDioErr(e as DioError).toString();
      CustomDialogueBoxError(ctx, "Error", errorMessage);
      rethrow;
    }
  }
}
