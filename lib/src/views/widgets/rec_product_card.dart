import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/src/controllers/cart_controller/cart_controller.dart';
import 'package:shopping_app/src/controllers/products_controller/products_controller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// ignore: must_be_immutable
class RecProductCard extends StatelessWidget {
  final productsController = Get.find<ProductsController>();
  final cartController = Get.find<CartController>();
  dynamic e;
  RecProductCard({super.key, this.e});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: 175,
        height: 335,
        decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 240, 239, 239)),
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 247, 245, 245)),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      e.image.toString(),
                      fit: BoxFit.fill,
                      height: 150,
                      width: 120,
                    ),
                  ),
                  // child: e.image != null
                  //     ? Image.network(
                  //         e.image.toString(),
                  //         fit: BoxFit.fill,
                  //       )
                  //     : Image.network(
                  //         "https://cdn.shopify.com/s/files/1/1338/0845/collections/lippie-pencil_grande.jpg?v=1512588769",
                  //         height: 50,
                  //       ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 11,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LimitedBox(
                      maxWidth: 100,
                      child: Text(
                        e.title.toString(),
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(
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
                      itemBuilder: (context, _) => const Icon(
                        CupertinoIcons.star_fill,
                        color: Colors.amber,
                        size: 2,
                      ),
                      onRatingUpdate: (rating) {},
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ ${e.price.toString()}",
                      style: const TextStyle(fontSize: 17),
                    ),
                    IconButton(
                        onPressed: () {
                          cartController.addToCart(e);
                        },
                        icon: Icon(cartController.cartItems.contains(e)
                            ? Icons.add_task_rounded
                            : Icons.add_shopping_cart_rounded))
                  ],
                )
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {
                    productsController.Products.firstWhere(
                        (element) => element.id == e.id).favorite.toggle();
                    productsController.addToWishList(e);
                  },
                  icon: Icon(
                    productsController.Products.firstWhere(
                            (element) => element.id == e.id).favorite.value
                        ? CupertinoIcons.heart_fill
                        : CupertinoIcons.heart,
                    color: Colors.redAccent,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
