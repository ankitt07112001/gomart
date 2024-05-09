import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'package:connectivity/connectivity.dart';

class InternetCheckerWidget extends StatefulWidget {
  @override
  _InternetCheckerWidgetState createState() => _InternetCheckerWidgetState();
}

class _InternetCheckerWidgetState extends State<InternetCheckerWidget> {
  bool isConnected = false;
  late ConnectivityResult result;
  late StreamSubscription<ConnectivityResult> subscription;

  @override
  void initState() {
    super.initState();
    startStreaming();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  void checkInternet() async {
    result = await Connectivity().checkConnectivity();
    if (result != ConnectivityResult.none) {
      isConnected = true;
    } else {
      isConnected = false;
      showDialogBox();
    }
    setState(() {});
  }

  void showDialogBox() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text("No Internet"),
        content: const Text("Please check your internet connection"),
        actions: [
          CupertinoButton(
            child: const Text("Retry"),
            onPressed: () {
              Navigator.pop(context);
              checkInternet();
            },
          ),
        ],
      ),
    );
  }

  void startStreaming() {
    subscription =
        Connectivity().onConnectivityChanged.listen((event) async {
      checkInternet();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isConnected
            ? Text("Connected to the Internet")
            : Text("No Internet Connection"),
      ),
    );
  }
}