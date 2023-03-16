import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/src/controllers/cart_controller/cart_controller.dart';
import 'package:shopping_app/src/views/widgets/cart_item_card.dart';

// ignore: must_be_immutable
class CartPage extends StatelessWidget {
  CartController cartController = Get.put(CartController());
  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (cartController.cartItems.isEmpty) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Your Cart"),
          ),
          body: const Center(
            child: Text("No items in cart"),
          ),
        );
      } else {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Cart Page"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: cartController.cartItems
                          .map((element) => CartItemsCard(
                                e: element,
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: const [
                      Icon(CupertinoIcons.location_fill),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "23 - Park Ave...",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.black),
                      onPressed: () {},
                      child: Text(
                        "Checkout - \$ ${cartController.totalCartAmount.toStringAsFixed(2)}",
                        style: const TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
          ),
        );
      }
    });
  }
}
