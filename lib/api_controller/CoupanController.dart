import 'package:get/get.dart';
import 'package:gomart/api_controller/api_method.dart';

import '../model/api_model/GetCoupanModel.dart';

class CoupanController extends GetxController {
  var CoupanList = [].obs;
  var isLoadingCoupan = false.obs;
  getCoupanCode() async {
    isLoadingCoupan.value = true;
    await Api_Method()
        .getapi(api_name: "getCouponcode", data: []).then((value) {
      GetCoupanModel coupan = GetCoupanModel.fromJson(value);
      CoupanList.value = coupan.data;
      print(value.toString());
      if (value["status"] == true) {
        isLoadingCoupan.value = false;
      } else {
        isLoadingCoupan.value = false;
      }
      isLoadingCoupan.value = false;
    });
  }

  applyCoupan(code) async {
    var mydata = {
      "coupon_code": code,
    };
    await Api_Method()
        .getapi(api_name: "applycouponcode", data: mydata)
        .then((value) {
      if (value["status"] == true) {
        Get.snackbar("Successfully", value['message']);
      } else {
        Get.snackbar("Retry", value['message']);
      }
    });
  }

  removeCoupan(id) async {
    var mydata = {
      "coupan_id": id,
    };
    await Api_Method()
        .getapi(api_name: "RemoveCouponcode", data: mydata)
        .then((value) {
      print("delete" + value.toString());
    });
  }
}
