import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/cart_controller/cart_controller.dart';
import 'package:shopping_app/controllers/products_controller/products_controller.dart';

class RecProductCard extends StatelessWidget {
  ProductsController productsController = Get.put(ProductsController());
  CartController cartController = Get.put(CartController());
  dynamic e;
  RecProductCard({super.key, this.e});

  @override
  Widget build(BuildContext context) {
    print(
        "object is => ${productsController.Products.firstWhere((element) => element.id == e.id).favorite}");
    return Obx(() => Container(
          width: 185,
          height: 280,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.grey[200]),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: e.image != null
                            ? Image.network(
                                "${e.image.toString()}",
                                height: 150,
                              )
                            : Image.network(
                                "https://cdn.shopify.com/s/files/1/1338/0845/collections/lippie-pencil_grande.jpg?v=1512588769",
                                height: 50,
                              ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed: () {
                            productsController.Products.firstWhere(
                                    (element) => element.id == e.id)
                                .favorite
                                .toggle();
                          },
                          icon: Icon(
                            // productsController.Products[e].favorite.isTrue
                            //     ? CupertinoIcons.heart_fill
                            //     : CupertinoIcons.heart,
                            productsController.Products.firstWhere(
                                        (element) => element.id == e.id)
                                    .favorite
                                    .value
                                ? CupertinoIcons.heart_fill
                                : CupertinoIcons.heart,
                            // CupertinoIcons.add,
                            color: Colors.redAccent,
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: 11,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LimitedBox(
                      maxWidth: 100,
                      child: Text(
                        "${e.title.toString()}",
                        style: TextStyle(fontSize: 10),
                        maxLines: 2,
                      ),
                    ),
                    Text(
                      "${e.rating.rate.toString()} ",
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${e.price.toString()}",
                    ),
                    IconButton(
                        onPressed: () {
                          cartController.addToCart(e);
                        },
                        icon: Icon(Icons.add_shopping_cart))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
