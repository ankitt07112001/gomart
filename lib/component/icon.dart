import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api_controller/cartController.dart';

class Myicon extends StatelessWidget {
  final void Function()? onTap;

  Myicon({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) => InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Image.asset("assets/images/cart.png"),
            ),
            if (controller.cartLength > 0)
              Obx(
                () => Positioned(
                  right: 0,
                  top: 0,
                  child: CircleAvatar(
                    foregroundColor: Colors.red,
                    radius: 10,
                    backgroundColor: Colors.white,
                    child: Text(
                      controller.cartLength.toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
