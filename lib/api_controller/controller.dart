import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gomart/api_controller/url.dart';
import 'package:gomart/pages/Registation_otp.dart';
import 'package:gomart/pages/login.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../model/api_model/bannermodel.dart';
import '../pages/mainscreen.dart';
import 'api_method.dart';

class Controller extends GetxController {
  var carouselList = [];
  var CatList = [].obs;
  var catproduct = [].obs;
  var isLoading = false.obs;
  var isLoadingr = false.obs;
  var isLoadingSlide = false.obs;
  var isLoadingcat = false.obs;
  var getProductLoader = false.obs;
  var registerLoading = false.obs;

  TextEditingController forgotemail = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController Create_Password = TextEditingController();
  TextEditingController Confirm_Password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phno = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController newConfirmPassword = TextEditingController();
  TextEditingController registeremail = TextEditingController();
  TextEditingController regverifyotp = TextEditingController();

  // TextEditingController sendnotp = TextEditingController();
  TextEditingController verifyotp = TextEditingController();
  var box = GetStorage();
  //...........................login page api.........................................................
  void loginapi(cntx) async {
    isLoading.value = true;
    var url = baseurl;
    var data = {
      "email": email.text,
      "password": password.text,
      "login_type": 1
    };
    var body = json.encode(data);
    var urlparse = Uri.parse(url + "login");

    var response = await http.post(urlparse, body: body, headers: {
      "Content-Type": "application/json",
    });

    var dattaa = json.decode(response.body);
    if (dattaa['status'] == true) {
      print(dattaa.toString());
      Get.off(() => Mymainscreen());
      box.write("token", dattaa['token']);
      box.write("user_name", dattaa['data']['name']);
      box.write("user_name", dattaa['data']['name']);
      box.write("user_email", dattaa['data']['email']);
      box.write("user_number", dattaa['data']['phone']);
      email.clear();
      password.clear();
      isLoading.value = false;
    } else {
      isLoading.value = false;
      Get.snackbar("message", dattaa['message'], backgroundColor: Colors.green);
      if (dattaa["type"] == "blocked") {
        registeremail.text = email.text;
        registersendOtp();
        Get.off(Myregotp());
      }
    }
    isLoading.value = false;
  }

//................................login page api...................................................................

  registerapi() async {
    registerLoading.value = true;
    print("loading api " + registerLoading.value.toString());
    var mydata = {
      "name": name.text,
      "email": registeremail.text,
      "phone": phno.text,
      "password": Confirm_Password.text,
      "fcm_token": box.read("fcmtoken"),
      "login_type": 1,
    };
    await Api_Method()
        .getapi(api_name: "userRegister", data: mydata)
        .then((value) {
      print(value.toString());
      if (value['status'] == true) {
        registersendOtp();
        Get.off(Myregotp());
        Get.snackbar("message", value['message'],
            backgroundColor: Colors.green);
        box.write("token", value['token']);
        isLoadingr.value = false;
      } else {
        registerLoading.value = false;

        // Get.snackbar("message", value['errors']['email']["phone"][0],
        //     backgroundColor: Colors.green);
        // Get.snackbar("message", value['errors']['phone'][0],
        //     backgroundColor: Colors.green);
      }
      registerLoading.value = false;
    });
  }

//........api of register.........................

//..........api of forgot................................//

  void forgotapi() async {
    var url = baseurl;
    var data = {
      "email": forgotemail.text,
    };
    var body = json.encode(data);
    var urlparse = Uri.parse(url + "forgetPassword");

    var response = await http.post(urlparse, body: body, headers: {
      "Content-Type": "application/json",
    });

    var dattaa = json.decode(response.body);
    print(dattaa.toString());
    if (dattaa['status'] == true) {
      Get.snackbar("message", dattaa['message'], backgroundColor: Colors.green);
      forgotemail.clear();
    } else {
      Get.snackbar("message", dattaa['message'], backgroundColor: Colors.green);
    }
  }

//..........api of forgot................................//

//...........send otp api......................///

  void sendOtp() async {
    var url = baseurl;
    var data = {
      "email": forgotemail.text,
    };
    var body = json.encode(data);
    var urlparse = Uri.parse(url + "sendOtp");

    var response = await http.post(urlparse, body: body, headers: {
      "Content-Type": "application/json",
    });

    var dattaa = json.decode(response.body);
    print(dattaa.toString());
    if (dattaa['status'] == true) {
      Get.snackbar("message", dattaa['message'], backgroundColor: Colors.green);
      forgotemail.clear();
    } else {
      Get.snackbar("message", dattaa['message'], backgroundColor: Colors.green);
    }
  }

//...........send otp api......................///

  //...........verify oto...................................//
  void verifyOtp() async {
    var url = baseurl;
    var data = {"email": forgotemail.text, "otp": verifyotp.text};
    var body = json.encode(data);
    print("Datat" + data.toString());
    var urlparse = Uri.parse(url + "verifyOtp");
    var response = await http.post(urlparse, body: body, headers: {
      "Content-Type": "application/json",
    });

    var dattaa = json.decode(response.body);
    print(dattaa.toString());
    box.write("user_id", dattaa['data']['id'].toString());
    // print("meri id :" + dattaa[data]);
  }

  //............verify otp.......................................//

//.....api of changepassword...............................//

  changePassword() async {
    var mydata = {
      "new_password": newPassword.text,
      "c_password": newConfirmPassword.text,
      "user_id": box.read("user_id")
    };
    await Api_Method()
        .getapi(api_name: "userChangepassword", data: mydata)
        .then((value) {
      print("meri value :" + value.toString());
      if (value['status'] == true) {
        Get.snackbar("message", value['message'],
            backgroundColor: Colors.green);
        Get.off(Mylogin());
        newPassword.clear();
        newConfirmPassword.clear();
      } else {
        Get.snackbar("message", value['message'],
            backgroundColor: Colors.green);
      }
    });
  }

//.....api of changepassword...............................//

//..........api of banner..................................//

  banner() async {
    isLoadingSlide.value = true;
    await Api_Method().getapi(api_name: "getBanner", data: []).then((value) {
      if (value["status"] == true) {
        Welcome bannermodel = Welcome.fromJson(value);
        // print(bannermodel.data[0].bannerImage.toString());
        carouselList = bannermodel.data;
        isLoadingSlide.value = false;
      } else {
        Get.snackbar("message", value['message']);
        isLoadingSlide.value = false;
      }
    });
    isLoadingSlide.value = false;
  }

  registersendOtp() async {
    var mydata = {
      "email": registeremail.text,
    };

    await Api_Method().getapi(api_name: "sendOtp", data: mydata).then((value) {
      if (value['status'] == true) {
        Get.snackbar("message", value['message'],
            backgroundColor: Colors.green);
      } else {
        Get.snackbar("message", value['message'],
            backgroundColor: Colors.green);
      }
    });
  }

  void registerverifyOtp() async {
    var mydata = {"email": registeremail.text, "otp": regverifyotp.text};

    await Api_Method()
        .getapi(api_name: "verifyOtp", data: mydata)
        .then((value) {
      print(value.toString());
      box.write("user_id", value['data']['id'].toString());
      if (value['status'] == true) {
        Get.off(Mylogin());
        print(value.toString());
        name.clear();
        registeremail.clear();
        phno.clear();
        Create_Password.clear();
        Confirm_Password.clear();
      }
    });
  }
}
