import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:gomart/api_controller/api_method.dart';

import '../model/api_model/CateogoryModel.dart';
import '../model/api_model/getCateogoryModel.dart';

class CateogoryController extends GetxController {
  var CategoryList = [].obs;
  var isLoadingcat = false.obs;
  var GetProduct = [].obs;

  var getProductLoader = false.obs;

  cateogoryapi() async {
    isLoadingcat.value = true;

    await Api_Method().getapi(api_name: "getCategory", data: []).then((value) {
      if (value['status'] == true) {
        CateogoryModel catmodel = CateogoryModel.fromJson(value);
        CategoryList.value = catmodel.data;
        print("data h mera" + CategoryList.value.toString());
        isLoadingcat.value = false;
      } else {
        Get.snackbar("message", value['message']);
        isLoadingcat.value = false;
      }
      isLoadingcat.value = false;
    });
  }

  getProduct(catid) async {
    getProductLoader.value = true;
    // print("kuch b print");
    var mydata = {
      'category_id': catid,
    };
    await Api_Method()
        .getapi(api_name: "getProductByCatID", data: mydata)
        .then((value) {
      if (value['status'] == true) {
        print("value :" + value.toString());
        GetCateogoryModel Netcat = GetCateogoryModel.fromJson(value);
        // print("iske andar");
        GetProduct.value = Netcat.data.product;
        getProductLoader.value = false;
        // print("length :" + catproduct.length.toString());
      } else {
        Get.snackbar("message", "Internet error");
        getProductLoader.value = false;
      }
    });
    getProductLoader.value = false;
  }
}
