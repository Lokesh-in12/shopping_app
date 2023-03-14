import 'package:get/get.dart';
import 'package:shopping_app/models/product_model/product_model.dart';

class CartController extends GetxController {
  var cartItems = <ProductModel>[].obs;

  void addToCart(ProductModel product) {
    cartItems.add(product);
  }
}
