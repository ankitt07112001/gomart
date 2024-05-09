import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InternetConnectionApi {
   showDialogBox(BuildContext context) {
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
              // checkInternet();
            },
          ),
        ],
      ),
    );
  }
}
