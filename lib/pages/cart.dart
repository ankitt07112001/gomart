import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gomart/model/foodlist.dart';
import 'package:gomart/pages/mainscreen.dart';
import 'package:gomart/utils/svg_string.dart';
import 'package:gomart/utils/svgstring.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../api_controller/CoupanController.dart';
import '../api_controller/OrderController.dart';
import '../api_controller/cartController.dart';
import '../api_controller/controller.dart';
import '../component/Shimmer/ShimmerWidget.dart';
import '../component/backgroundcontainer.dart';
import '../component/button.dart';
import '../component/button1.dart';
import '../component/cart_bill.dart';
import '../component/carttile.dart';
import '../component/icon.dart';
import '../model/api_model/GetCoupanModel.dart';
import '../model/foodinfo.dart';
import '../model/promo.dart';
import 'Addresspg.dart';

class Mycart extends StatefulWidget {
  final visible;

  const Mycart({super.key, required this.visible});

  @override
  State<Mycart> createState() => _MycartState();
}

class _MycartState extends State<Mycart> {
  // var myController1 = Get.put(Controller());
  var cartController = Get.put(CartController());
  var orderController = Get.put(OrderController());
  var coupanController = Get.put(CoupanController());
  CouponDatum? selectedCoupan;

  // var sum = 0.0;
  var disamount = 0.0;

  // var payamount = 0.0;
  var taxamount = 0.0;
  var amount1 = 0.0;
  double newprice = 0;
  double totalPrice = 0;

  String? appliedPromoCode;
  void updateTotalPrice() {
    double totalPrice = 0;
    if (cartController.getCartItem.length > 0) {
      for (int i = 0; i < cartController.getCartItem.length; i++) {
        var item = cartController.getCartItem[i];
        double newprice =
            int.parse(item.itemPrice) / int.parse(item.itemQuantity);
        totalPrice += newprice * int.parse(item.itemQuantity);
      }
      orderController.sumamount = totalPrice;
      if (cartController.getCartItem.length > 0) {
        taxamount = orderController.sumamount * 8 / 100;
        amount1 = orderController.sumamount + taxamount;
        disamount = amount1 * 5 / 100;
        orderController.totalamount =
            double.parse((amount1 - disamount).toString());
      } else {
        disamount = 0.0;
        orderController.totalamount = double.parse((0.0).toString());
        taxamount = 0.0;
        amount1 = 0.0;
      }
      setState(() {});
    } else {
      orderController.totalamount = 0.0;
      orderController.sumamount = 0.0;
      setState(() {});
    }
  }

  void addTotalPrice(oldprice, price) {
    double totalPrice = 0;
    totalPrice = orderController.sumamount - oldprice;
    orderController.sumamount = totalPrice + price;
    if (cartController.getCartItem.length > 0) {
      taxamount = orderController.sumamount * 8 / 100;
      amount1 = orderController.sumamount + taxamount;
      disamount = amount1 * 5 / 100;
      orderController.totalamount =
          double.parse((amount1 - disamount).toString());
    } else {
      disamount = 0.0;
      orderController.totalamount = double.parse((0.0).toString());
      taxamount = 0.0;
      amount1 = 0.0;
    }
    setState(() {});
  }

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 200), () {
      cartController.getCartApi().then((value) {
        updateTotalPrice();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Mybackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Visibility(
                      visible: widget.visible,
                      child: SvgPicture.string(arrowback)),
                ),
                Text("Cart",
                    style: GoogleFonts.openSans(
                      textStyle:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    )),
                Myicon(
                  onTap: () {},
                ),
              ],
            ),
            Column(children: [
              Container(
                height: MediaQuery.of(context).size.height * .50.h,
                child: Obx(
                  () => cartController.isLoadingCartGet.value == true
                      ? ShimmerWidgetCart()
                      : ListView.separated(
                          // physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: cartController.getCartItem.length,
                          itemBuilder: (context, index) {
                            // final cartitems = cartController.getCartItem[index];
                            return Mycarttile(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) => AlertDialog(
                                          backgroundColor: Colors.green,
                                          content: Text(
                                            "Are you sure to delete ?",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  cartController
                                                      .removeFromCart(
                                                          cartController
                                                              .getCartItem[
                                                                  index]
                                                              .id,
                                                          index)
                                                      .then((value) {
                                                    Navigator.pop(context);
                                                  });
                                                },
                                                child: Text(
                                                  "Yes",
                                                  style: GoogleFonts.openSans(
                                                      textStyle: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15)),
                                                )),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("No",
                                                    style: GoogleFonts.openSans(
                                                        textStyle: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15))))
                                          ],
                                        ));
                              },
                              increment: (qty, price, oldprice) {
                                var id1 = cartController.getCartItem[index].id;
                                var id3 =
                                    cartController.getCartItem[index].itemId;
                                var id2 = qty;
                                cartController
                                    .updateCartApi(id1, id2, id3)
                                    .then((value) {
                                  var newprice = price * qty;
                                  addTotalPrice(oldprice, newprice);
                                  setState(() {});
                                });
                              },
                              decrement: (qty,price,oldprice) {
                                var id1 = cartController.getCartItem[index].id;
                                var id3 =
                                    cartController.getCartItem[index].itemId;
                                var id2 = qty;
                                 cartController
                                    .updateCartApi(id1, id2, id3)
                                    .then((value) {
                                  var newprice = price * qty;
                                  addTotalPrice(oldprice, newprice);
                                  setState(() {});
                                });
                                                             },
                              imagepath:
                                  cartController.getCartItem[index].itemImage,
                              text: cartController.getCartItem[index].itemName,
                              price:
                                  cartController.getCartItem[index].itemPrice,
                              textquantity: cartController
                                  .getCartItem[index].itemQuantity,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 20,
                            );
                          },
                        ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image(
                    image: AssetImage("assets/images/promo.png"),
                    height: 30,
                    width: 30,
                  ),
                  if (appliedPromoCode !=
                      null) // Only show promo code and remove icon if promo code is applied
                    Expanded(
                      child: Container(
                        height: 40,
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  appliedPromoCode!,
                                  style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Color(0xff1E9DC2),
                                    ),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  appliedPromoCode =
                                      null; // Remove the applied promo code
                                }); // Recalculate the price when promo code is removed
                              },
                              icon: Icon(Icons.remove_circle),
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    Container(
                      child: Text(
                        "Promo Code?", // Show "Promo Code?" text if no promo code is applied
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Color(0xff1E9DC2),
                          ),
                        ),
                      ),
                    ),
                  if (appliedPromoCode ==
                      null) // Show apply button if no promo code is applied
                    Container(
                      height: 40,
                      width: 110,
                      child: Mybutton(
                        text: 'Apply',
                        onTap: () {
                          coupanController.getCoupanCode();
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) => DraggableScrollableSheet(
                              initialChildSize: 0.40,
                              minChildSize: 0.40,
                              maxChildSize: 0.8,
                              expand: false,
                              builder: (BuildContext context,
                                  ScrollController scrollController) {
                                return Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 30.0),
                                      child: Container(
                                        child: ListView.builder(
                                          controller: scrollController,
                                          shrinkWrap: true,
                                          itemCount: coupanController
                                              .CoupanList.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            final items = coupanController
                                                .CoupanList[index];
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0,
                                                  right: 8.0,
                                                  top: 10),
                                              child: Card(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 18.0),
                                                      child: Text(
                                                        items.coupanTitle,
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontFamily:
                                                              'Be Vietnam',
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Column(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            18.0),
                                                                child: Text(
                                                                  items
                                                                      .couponDesc,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xFF828282),
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontFamily:
                                                                        'Be Vietnam',
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 40.0,
                                                                  bottom: 25,
                                                                  right: 10),
                                                          child: Common_button(
                                                            name: 'Apply',
                                                            width: 70.0,
                                                            height: 30.0,
                                                            fontSize: 18.0,
                                                            onTap: () {
                                                              coupanController.applyCoupan(
                                                                  coupanController
                                                                      .CoupanList[
                                                                          index]
                                                                      .coupanCode);
                                                              setState(() {
                                                                appliedPromoCode =
                                                                    items
                                                                        .coupanTitle;
                                                              });
                                                              // Recalculate the price when promo code is applied
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 338.0),
                                        child: CircleAvatar(
                                          radius: 15,
                                          backgroundColor: Color(0xff405B7E),
                                          child: Icon(
                                            Icons.close,
                                            color: Color(0xffFFFFFF),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                          );
                          print("tap");
                        },
                      ),
                    )
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Mycartbill(
                text: orderController.sumamount.toStringAsFixed(2),
                text1: disamount.toStringAsFixed(2),
                tax2: taxamount.toStringAsFixed(2),
                text4: orderController.totalamount.toStringAsFixed(2),
              ),
              // : Text("Add your item"),
            ]),
            SizedBox(
              height: 20.h,
            ),
            Mybutton(
                text: "Checkout",
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Addresspg()));
                }),
            SizedBox(
              height: 10.h,
            )
          ],
        ),
      ),
    );
  }
}
