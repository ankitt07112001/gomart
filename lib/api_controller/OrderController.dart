import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gomart/api_controller/addressCongtroller.dart';
import 'package:gomart/api_controller/api_method.dart';

import '../model/api_model/GetOrderByOrderNoModel.dart';
import '../model/api_model/GetOrderModel.dart';
import '../pages/Paymentpgdone.dart';

class OrderController extends GetxController {
  var addController = Get.put(AddressControlller());
  var GetOrderList = [].obs;
  var isLoadingGetOrder = false.obs;
  var ListByOrderNum = [].obs;
  var isLoadingByOrder = false.obs;
  var isLoadingDelete = false.obs;
  var totalamount = 0.0;
  var sumamount = 0.0;

  addOrderApi(data, address) async {
    var datas = [];
    for (var i = 0; i < data.length; i++) {
      datas.add({
        'item_id': data[i].itemId,
        "item_quantity": data[i].itemQuantity,
        "item_name": data[i].itemName,
        "item_price": data[i].itemPrice
      });
      print(data[i].itemId.toString());
    }

    var mydata = {
      "items": datas,
      "order_amount": totalamount,
      "payment_method": "cod",
      "order_type": 0,
      "coupon_id": 0,
      "address": address,
    };
    print("mydata" + mydata.toString());
    print("total amount" + totalamount.toString());
    await Api_Method().getapi(api_name: "addOrder", data: mydata).then((value) {
      print('--------' + value.toString());
      if (value['status'] == true) {
        // Navigator.push(context,MaterialPageRoute(builder:(_)=>Paymentpage_Done))
        Get.to(() => Paymentpage_Done());
        Get.snackbar("Message", value['message']);
      } else {
        Get.snackbar("Retry", value['message']);
      }
    });
  }

  getOrderDetailApi() async {
    isLoadingGetOrder.value = true;
    await Api_Method()
        .getapi(api_name: "getOrderdetail", data: []).then((value) {
      GetOrderDetailModel order = GetOrderDetailModel.fromJson(value);
      GetOrderList.value = order.data;
      if (value["status"] == true) {
        isLoadingGetOrder.value = false;
      } else {
        isLoadingGetOrder.value = false;
      }
      isLoadingGetOrder.value = false;
    });
  }

  getOrderByorderNoApi(order_no) async {
    isLoadingByOrder.value = true;
    var mydata = {
      "order_no": order_no,
    };
    await Api_Method()
        .getapi(api_name: "getOrderByOrderNo", data: mydata)
        .then((value) {
      GetOrderByorderNoModel orderno = GetOrderByorderNoModel.fromJson(value);
      ListByOrderNum.value = orderno.data;
      if (value["status"] == true) {
        isLoadingByOrder.value = false;
      } else {
        isLoadingByOrder.value = false;
      }
      isLoadingByOrder.value = false;
    });
    return;
  }

  cancelOrderApi(order_no) async {
    var mydata = {"order_no": order_no};
    await Api_Method()
        .getapi(api_name: "cancelOrder", data: mydata)
        .then((value) {
      print(value.toString());
    });
  }

  deleteOrderApi(order_no, index) async {
    isLoadingDelete.value = true;
    var mydata = {"order_no": order_no};
    await Api_Method()
        .getapi(api_name: "deleteorder", data: mydata)
        .then((value) {
      print(value.toString());

      if (value['status'] == true) {
        isLoadingDelete.value = false;
      } else {
        isLoadingDelete.value = false;
      }
      isLoadingDelete.value = false;
    });
  }
}
