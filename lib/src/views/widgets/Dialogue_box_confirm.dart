import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_app/src/controllers/cart_controller/cart_controller.dart';
import 'package:shopping_app/src/models/product_model/product_model.dart';

final cartController = Get.find<CartController>();

// ignore: non_constant_identifier_names
void ConfirmDialogue(
    BuildContext ctx, String title, String desc, ProductModel e) {
  showDialog(
      context: ctx,
      builder: (context) => AlertDialog(
            title: Text(title),
            content: Text(desc),
            actions: [
              TextButton(
                  onPressed: () => context.pop(), child: const Text("Cancel")),
              TextButton(
                  onPressed: () {
                    context.pop();
                    cartController.removeFromCart(e);
                  },
                  child: const Text("Ok")),
            ],
          ));
}
