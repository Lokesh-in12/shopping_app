import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/src/controllers/cart_controller/cart_controller.dart';
import 'package:shopping_app/src/controllers/products_controller/products_controller.dart';
import 'package:shopping_app/src/views/widgets/confirm_dialogue_box.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// ignore: must_be_immutable
class WishListCard extends StatelessWidget {
  final productsController = Get.find<ProductsController>();
  final cartController = Get.find<CartController>();

  dynamic e;
  WishListCard({super.key, this.e});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              border:
                  Border.all(color: const Color.fromARGB(255, 221, 220, 220))),
          width: double.infinity,
          height: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    e.image.toString(),
                    fit: BoxFit.contain,
                    height: 150,
                    width: 100,
                  ),
                ),
              ),
              Container(
                constraints: const BoxConstraints(maxWidth: 255),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LimitedBox(
                            maxWidth: 180, child: Text(e.title.toString())),
                        IconButton(
                            onPressed: () =>
                                ConfirmDialogue(context, "wishlist", e),
                            icon: const Icon(CupertinoIcons.delete))
                      ],
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      height: 10,
                    ),
                    RatingBar.builder(
                      itemSize: 14,
                      initialRating: e.rating.rate,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      // ignore: prefer_const_constructors
                      itemBuilder: (context, _) => Icon(
                        CupertinoIcons.star_fill,
                        color: Colors.amber,
                        size: 2,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      height: 20,
                    ),
                    Obx(() => IconButton(
                        onPressed: () => cartController.addToCart(e),
                        icon: Icon(cartController.cartItems.contains(e)
                            ? Icons.add_task_rounded
                            : Icons.add_shopping_cart_rounded)))
                  ],
                ),
              )
            ],
          ),
        ),
        // ignore: prefer_const_constructors
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
