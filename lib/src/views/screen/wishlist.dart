import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/src/controllers/cart_controller/cart_controller.dart';
import 'package:shopping_app/src/controllers/products_controller/products_controller.dart';
import 'package:shopping_app/src/views/widgets/wishlist_card.dart';

class WishListPage extends StatelessWidget {
  WishListPage({super.key});

  final productsController = Get.find<ProductsController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (productsController.WishList.isEmpty) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Your WishList"),
          ),
          // ignore: prefer_const_constructors
          body: Center(
            child: const Text("No items in WishList"),
          ),
        );
      }
      return Scaffold(
        appBar: AppBar(
          title: const Text("Your Wishlist"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children:
                    productsController.WishList.map((element) => WishListCard(
                          e: element,
                        )).toList(),
              ),
            ),
          ),
        ),
      );
    });
  }
}
