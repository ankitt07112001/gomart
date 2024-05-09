import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gomart/pages/homepage1.dart';
import 'package:gomart/pages/login.dart';
import '../firebase/Getfirebasetoken.dart';
import '../firebase/NotificationServices.dart';
import 'mainscreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => SplashscreenState();
}

var storage = GetStorage();
// var isFirstTime = null;
//  final storage = FlutterSecureStorage();
bool isFirstTime = GetStorage().read("firstTime") == null;

class SplashscreenState extends State<Splashscreen> {
  // static const String KEYLOGIN = "login";

  void initState() {
    firebase();
    whereToGo(context);
    super.initState();
  }

  firebase() async {
    PushNotificationService().setupInteractedMessage();
    await GetFirebasetoken().getfirebasetoken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.green),
        child: Padding(
          padding: EdgeInsets.only(top: 0.5),
          child: Image(image: AssetImage('assets/images/slpash.png')),
        ),
      ),
    );
  }
}

whereToGo(context) {
  Timer(Duration(seconds: 2), () async {
    // bool isFirstTime = await storage.read(key: "firstTime") == null;

    // If it's the first time, navigate to the Homepage
    if (isFirstTime) {
      Get.off(() => Homepage1());
      GetStorage().write("firstTime", false);
    } else {
      // Otherwise, check for token
       String? token = GetStorage().read("token");
      if (token == null) {
        Get.off(() => Mylogin());
      } else {
        Get.off(() => Mymainscreen());
      }
    }
  });
}
