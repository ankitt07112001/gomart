import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gomart/api_controller/api_method.dart';

import '../model/api_model/GetCartModel.dart';

class CartController extends GetxController {
  var getCartItem = [].obs;
  var isLoadingCart = false.obs;
  var isLoadingCartGet = false.obs;
  var isLoadingDelete = false.obs;
  var quantityCount = 1.obs;
  var cartLength = 0.obs;

  cartApi(product, quantity) async {
    isLoadingCart.value = true;
    var mydata = {
      "item_id": product.itemId,
      "item_name": product.itemName,
      "item_price": product.itemPrice,
      "item_quantity": quantity,
      "item_weight": product.itemWeight[1],
      // "item_expiry_date": product.itemExpiryDate.toString(),
      "item_description": product.itemDescription,
    };

    await Api_Method().getapi(api_name: "Addcart", data: mydata).then((value) {
      log("DATATA" + value.toString());
      if (value["status"] == true) {
        Get.snackbar("message", value['message'],
            backgroundColor: Colors.green);
        cartLength + 1;
        isLoadingCart.value = false;
      } else {
        Get.snackbar("message", value['message'],
            backgroundColor: Colors.green);
        isLoadingCart.value = false;
      }
    });
  }

  Future<dynamic> getCartApi() async {
    isLoadingCartGet.value = true;
    await Api_Method().getapi(api_name: "getCartItem", data: []).then((value) {
      if (value["status"] == true) {
        GetCartMOdel cartmodel = GetCartMOdel.fromJson(value);
        getCartItem.value = cartmodel.data;
        cartLength.value = getCartItem.length;
        isLoadingCartGet.value = false;
        print("controller pr" + getCartItem.length.toString());
      } else {
        isLoadingCartGet.value = false;
      }
    });
    return;
  }

  Future<dynamic> removeFromCart(id, index) async {
    isLoadingDelete.value = true;
    var mydata = {"cart_id": id};
    await Api_Method()
        .getapi(api_name: "RemoveAddcart", data: mydata)
        .then((value) {
      if (value['status'] == true) {
        getCartItem.removeAt(index);
        cartLength - 1;
        isLoadingDelete.value = false;
        return true;
      } else {
        Get.snackbar("message", value['message']);
        isLoadingDelete.value = false;
        return false;
      }
      isLoadingDelete.value = false;
    });
  }

  updateCartApi(id, quantity, item_id) async {
    var mydata = {
      "id": id,
      "item_quantity": quantity,
      "item_id": item_id,
    };
    await Api_Method()
        .getapi(api_name: "updateItemQuantity", data: mydata)
        .then((value) {});
  }
}
