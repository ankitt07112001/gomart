import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gomart/api_controller/url.dart';
import 'package:http/http.dart' as http;

class Api_Method {
  var box = GetStorage();
  var response;
  getapi({
    api_name,
    data,
  }) async {
    try {
      var url = baseurl;
      var bodydata = json.encode(data);
      var urlparse = Uri.parse(url + api_name);
      response = await http.post(urlparse, body: bodydata, headers: {
        "Content-Type": "application/json",
        "Authorization":
            box.read("token") == null ? "" : "Bearer" + box.read("token"),
      }).timeout(Duration(seconds: 10));
    } on SocketException {
      print("no internrt");
      Get.snackbar("Error", "Please check YOur Internet Connection").toString();
      // InternetConnectionApi().
      // InternetCheckerWidget.checkInternet();
    }
    return json.decode(response.body);
  }
}
