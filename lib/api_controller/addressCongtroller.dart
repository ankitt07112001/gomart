import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:gomart/api_controller/api_method.dart';
import 'package:gomart/api_controller/url.dart';
import 'package:gomart/pages/Paymentpg.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class AddressControlller extends GetxController {
  TextEditingController building = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController zipcode = TextEditingController();
  var address;
   addressApi(addresstype) async {
    var mydata = {
      "address": street.text,
      "zip": zipcode.text,
      "city": zipcode.text,
      "address_type": addresstype,
      "building": building.text,
    };
    await Api_Method()
        .getapi(api_name: "useraddress", data: mydata)
        .then((value) {
      if (value['status'] == true) {
        building.clear();
        zipcode.clear();
        street.clear();
        address = value['data']['address'];
        print(address.toString());
      }
    });
  }
}
