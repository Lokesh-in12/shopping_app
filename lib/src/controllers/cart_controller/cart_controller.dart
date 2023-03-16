import 'package:get/get.dart';
import 'package:shopping_app/src/models/product_model/product_model.dart';

class CartController extends GetxController {
  var cartItems = <ProductModel>[].obs;

  double get totalCartAmount =>
      cartItems.fold(0, (sum, item) => sum + (item.price! * item.quan.value!));

  void addToCart(ProductModel product) {
    if (cartItems.contains(product)) {
      cartItems.remove(product);
    } else {
      cartItems.add(product);
    }
  }

  void incQuan(ProductModel product) {
    cartItems.firstWhere((element) => element.id == product.id).quan.value++;
  }

  void decQuan(ProductModel product) {
    // ignore: unrelated_type_equality_checks
    if (cartItems.firstWhere((element) => element.id == product.id).quan == 1) {
      cartItems.remove(product);
    } else {
      cartItems.firstWhere((element) => element.id == product.id).quan.value--;
    }
  }

  void removeFromCart(ProductModel product) {
    cartItems.remove(product);
  }
}
