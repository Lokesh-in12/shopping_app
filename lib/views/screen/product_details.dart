import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      drawer: Drawer(
        child: Text("hey"),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Row(
              children: [Text("data")],
            )
          ],
        ),
      ),
    ));
  }
}
