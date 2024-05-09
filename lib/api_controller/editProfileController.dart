import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gomart/api_controller/api_method.dart';
import 'package:gomart/model/api_model/userProfileModel.dart';
import 'package:http/http.dart' as http;

class EditProfileController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController name = TextEditingController();
  var UserProfileList = [].obs;
  var box = GetStorage();
  bool showSpinner = false;
  File? imageedit;
  Future<void> editProfileApi() async {
    print("api image" + imageedit.toString());
    showSpinner = true;
    var stream = new http.ByteStream(imageedit!.openRead());
    stream.cast();
    var length = await imageedit!.length();
    var url = "https://gomart.thecompletesoftech.in/api/v1/customer/";

    var uri = Uri.parse(url + "update-profile");
    var request = new http.MultipartRequest("POST", uri);
    request.fields['email'] = email.text;
    request.fields['phone'] = phone.text;
    request.fields['name'] = name.text;

    var Multiport = new http.MultipartFile("profile", stream, length);
    request.files.add(Multiport);
    request.headers.addAll({
      "Content-Type": "application/json",
      "Authorization":
          box.read("token") == null ? "" : "Bearer" + box.read("token"),
    });
    log("SEND DATA" + request.files.toString());

    await request.send().then((response) async {
      print("api 1" + imageedit.toString());
      var resp = await response.stream.bytesToString();
      // log("response" + response.stream.bytesToString().toString());
      log("REDDD" + resp.toString());
      if (response.statusCode == 200) {
        print("api 2" + imageedit.toString());
        showSpinner = false;
      } else {
        showSpinner = false;
      }
    });
  }

  getEditProfile() async {
    await Api_Method().getapi(api_name: "userProfile", data: []).then((value) {
      print("get ki api" + imageedit.toString());
      UserProfileModel user = UserProfileModel.fromJson(value);
      UserProfileList.value = user.data;
      print("get ki api 2" + imageedit.toString());
      print("get li api 3" + UserProfileList[0].profile.toString());
      name.text = UserProfileList[0].name;
      email.text = UserProfileList[0].email;
      phone.text = UserProfileList[0].phone;
    });
  }
}
