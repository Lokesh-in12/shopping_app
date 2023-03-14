import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_app/controllers/cart_controller/cart_controller.dart';
import 'package:shopping_app/controllers/products_controller/products_controller.dart';
import 'package:shopping_app/views/widgets/loading_shimmer_widget.dart';
import 'package:shopping_app/views/widgets/rec_product_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  ProductsController productsController = Get.put(ProductsController());
  CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => SafeArea(
            child: Scaffold(
          appBar: AppBar(
            title: Text("Shopping App"),
            actions: [
              ElevatedButton.icon(
                  onPressed: () => context.push('/cart'),
                  icon: Icon(Icons.add_shopping_cart_rounded),
                  label: Text("${cartController.cartItems.length}"))
            ],
          ),
          drawer: Drawer(
            child: Text("hey"),
          ),
          body: SafeArea(
            child: Container(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    productsController.isLoading.value
                        ? Padding(
                            padding: EdgeInsets.only(left: 20, top: 20),
                            child: Wrap(
                              children: [
                                LoadingShimmerWidget(),
                                SizedBox(
                                  width: 80,
                                ),
                                LoadingShimmerWidget(),
                                LoadingShimmerWidget(),
                                SizedBox(
                                  width: 80,
                                ),
                                LoadingShimmerWidget(),
                                LoadingShimmerWidget(),
                                SizedBox(
                                  width: 80,
                                ),
                                LoadingShimmerWidget(),
                                LoadingShimmerWidget(),
                                SizedBox(
                                  width: 80,
                                ),
                                LoadingShimmerWidget(),
                                SizedBox(
                                  width: 80,
                                ),
                              ],
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            child: Wrap(
                              spacing: 20,
                              children: productsController.Products.map<Widget>(
                                (element) => RecProductCard(
                                  e: element,
                                ),
                              ).toList(),
                            ),
                          )
                  ],
                ),
              ),
            ),
          ),
        )));
  }
}
