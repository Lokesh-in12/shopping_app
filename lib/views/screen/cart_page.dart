import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/cart_controller/cart_controller.dart';
import 'package:shopping_app/views/widgets/cart_item_card.dart';

class CartPage extends StatelessWidget {
  CartController cartController = Get.put(CartController());
  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if(cartController.cartItems.isEmpty){
        return Scaffold(
          appBar: AppBar(title: Text("Your Cart"),),
          body: Center(child: Text("No items in cart"),),);
      }else{
        return Scaffold(
          appBar: AppBar(
            title: Text("Cart Page"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: cartController.cartItems
                      .map((element) => CartItemsCard(
                            e: element,
                          ))
                      .toList(),
                ),
              ),
            ),
          ),
        );
      }
    });
  }
}
