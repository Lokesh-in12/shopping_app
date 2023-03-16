import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shopping_app/src/controllers/cart_controller/cart_controller.dart';
import 'package:shopping_app/src/views/widgets/confirm_dialogue_box.dart';

// ignore: must_be_immutable
class CartItemsCard extends StatelessWidget {
  dynamic e;
  CartItemsCard({super.key, this.e});

  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 221, 220, 220))),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            e.image.toString(),
                            fit: BoxFit.contain,
                            height: 150,
                            width: 100,
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 255),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  LimitedBox(
                                      maxWidth: 180,
                                      child: Text(e.title.toString())),
                                  IconButton(
                                      onPressed: () =>
                                          ConfirmDialogue(context, "cart", e),
                                      icon: const Icon(
                                          CupertinoIcons.clear_thick))
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
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  SizedBox(
                                    child: Row(
                                      children: <Widget>[
                                        IconButton(
                                            onPressed: () =>
                                                cartController.decQuan(e),
                                            icon: const Icon(
                                                CupertinoIcons.minus)),
                                        Text("${e.quan.value}"),
                                        IconButton(
                                            onPressed: () =>
                                                cartController.incQuan(e),
                                            // ignore: prefer_const_constructors
                                            icon: Icon(
                                              CupertinoIcons.add,
                                              size: 21,
                                            )),
                                      ],
                                    ),
                                  ),
                                  Text(
                                      "\$ ${(e.price * e.quan.value).toStringAsFixed(2)}")
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 10,
            )
          ],
        ));
  }
}
