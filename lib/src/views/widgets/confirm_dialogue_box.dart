import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_app/src/controllers/cart_controller/cart_controller.dart';
import 'package:shopping_app/src/controllers/products_controller/products_controller.dart';
import 'package:shopping_app/src/models/product_model/product_model.dart';

final cartController = Get.find<CartController>();
final productsController = Get.find<ProductsController>();

const String title = "Are you sure ?";
const String descCart = "This will remove this item from the cart";
const String descWishlist = "This will remove this item from the wishlist";

// ignore: non_constant_identifier_names
void ConfirmDialogue(BuildContext ctx, String type, ProductModel e) {
  showDialog(
      context: ctx,
      builder: (context) => AlertDialog(
            title: const Text(title),
            content: Text(type == "wishlist" ? descWishlist : descCart),
            actions: [
              TextButton(
                  onPressed: () => context.pop(), child: const Text("Cancel")),
              TextButton(
                  onPressed: () {
                    context.pop();
                    type == "wishlist"
                        ? productsController.addToWishList(e)
                        : cartController.removeFromCart(e);
                  },
                  child: const Text("Ok")),
            ],
          ));
}
