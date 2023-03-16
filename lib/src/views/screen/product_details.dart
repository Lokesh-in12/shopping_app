import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
      ),
      drawer: const Drawer(
        child: Text("hey"),
      ),
      body: SizedBox(
        width: double.maxFinite,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Row(
              children: const [Text("data")],
            )
          ],
        ),
      ),
    ));
  }
}
