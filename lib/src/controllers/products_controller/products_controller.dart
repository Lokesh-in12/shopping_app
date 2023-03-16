import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/src/models/product_model/product_model.dart';
import 'package:shopping_app/core/services/api_service.dart';

class ProductsController extends GetxController {
  // ignore: non_constant_identifier_names
  final Products = <ProductModel>[].obs;
  // ignore: non_constant_identifier_names
  final WishList = <ProductModel>[].obs;

  var isLoading = true.obs;
  BuildContext? ctx;
  ProductsController({this.ctx});

  @override
  void onInit() {
    super.onInit();
    fetchProducts(ctx);
  }

  void addToWishList(ProductModel product) {
    if (WishList.contains(product)) {
      WishList.remove(product);
      product.favorite.value = false;
    } else {
      WishList.add(product);
    }
  }

  void fetchProducts(ctx) async {
    try {
      isLoading(true);
      List<ProductModel> productsData = await ApiService.fetchProducts(ctx);
      if (productsData != []) {
        Products.value = productsData;
      }
      print("products data = > $productsData");
    } catch (e) {
      throw ("err occured in prdCont in fetchProducts ");
    } finally {
      isLoading(false);
    }
  }
}
