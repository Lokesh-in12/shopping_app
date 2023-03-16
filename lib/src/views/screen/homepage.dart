import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_app/src/controllers/cart_controller/cart_controller.dart';
import 'package:shopping_app/src/controllers/products_controller/products_controller.dart';
import 'package:shopping_app/src/views/widgets/loading_shimmer_widget.dart';
import 'package:shopping_app/src/views/widgets/rec_product_card.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProductsController productsController = Get.put(ProductsController());

  CartController cartController = Get.put(CartController());

  @override
  void initState() {
    super.initState();
    ProductsController(ctx: context);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: const Text("Shopping App"),
          elevation: 0.0,
          actions: [
            ElevatedButton.icon(
                // style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () => context.push('/cart'),
                icon: const Icon(Icons.add_shopping_cart_rounded),
                label: Text("${cartController.cartItems.length}"))
          ],
        ),
        drawer: Drawer(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          context.pop();
                          context.push('/wishList');
                        },
                        child: Row(
                          children: const [
                            Icon(
                              CupertinoIcons.heart_fill,
                              color: Colors.redAccent,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Your Wishlists",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  productsController.isLoading.value
                      ? Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Wrap(
                            children: const [
                              LoadingShimmerWidget(),
                              SizedBox(
                                width: 20,
                              ),
                              LoadingShimmerWidget(),
                              LoadingShimmerWidget(),
                              SizedBox(
                                width: 20,
                              ),
                              LoadingShimmerWidget(),
                              LoadingShimmerWidget(),
                              SizedBox(
                                width: 20,
                              ),
                              LoadingShimmerWidget(),
                              LoadingShimmerWidget(),
                              SizedBox(
                                width: 20,
                              ),
                              LoadingShimmerWidget(),
                              SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(left: 10, top: 20),
                          child: Wrap(
                            spacing: 17,
                            runSpacing: 17,
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
        bottomNavigationBar: BottomAppBar(
          // child: Text("wishlist ${productsController.WishList.value}"),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.home),
              ),
              IconButton(
                onPressed: () => context.push('/wishList'),
                icon: const Icon(CupertinoIcons.heart_fill),
                color: Colors.redAccent,
              ),
              IconButton(
                onPressed: () => context.push('/wishList'),
                icon: const Icon(CupertinoIcons.profile_circled),
              )
            ],
          ),
        ),
      )),
    );
  }
}
