import 'package:get/get.dart';
import 'package:shopping_app/models/product_model/product_model.dart';
import 'package:shopping_app/services/api_service.dart';

class ProductsController extends GetxController {
  var Products = <ProductModel>[].obs;
  // var whishList = Products.map((element) => element.favorite.value == true);
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      List<ProductModel> productsData = await ApiService.fetchProducts();
      if (productsData != []) {
        Products.value = productsData;
      }
      print("products data = > ${productsData}");
    } catch (e) {
      throw ("err occured in prdCont in fetchProducts ");
    } finally {
      isLoading(false);
    }
  }
}
