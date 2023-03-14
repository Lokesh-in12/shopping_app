import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CartItemsCard extends StatelessWidget {
  dynamic e;
  CartItemsCard({super.key, this.e});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  color: Colors.lightBlue,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "${e.image.toString()}",
                      fit: BoxFit.contain,
                      height: 150,
                      width: 100,
                    ),
                  ),
                ),
                Container(
                  width: 280,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LimitedBox(
                              child: Text("${e.title.toString()}"),
                              maxWidth: 180),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(CupertinoIcons.delete))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("⭐(${e.rating.toString()})"),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            child: Row(
                              children: <Widget>[
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(CupertinoIcons.minus)),
                                Text("1"),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      CupertinoIcons.add,
                                      size: 21,
                                    )),
                              ],
                            ),
                          ),
                          Text("\$ ${e.price.toString()}")
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
