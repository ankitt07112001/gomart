import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gomart/api_controller/api_method.dart';

import '../model/api_model/getProductModel.dart';
import '../model/api_model/productModel.dart';

class ProductController extends GetxController {
  var productLoading = false.obs;
  var ProductList = [].obs;

  productApi() async {
    productLoading.value = true;
    await Api_Method().getapi(api_name: "getProduct", data: []).then((value) {
      ProductModel productModel = ProductModel.fromJson(value);
      ProductList.value = productModel.data;
      if (value["status"] == true) {
        productLoading.value = false;
      } else {
        productLoading.value = false;
      }
      productLoading.value = false;
    });
  }
}
