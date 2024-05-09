import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gomart/api_controller/OrderController.dart';
import 'package:gomart/component/backgroundcontainer.dart';
import 'package:gomart/component/cart_bill.dart';
import 'package:gomart/component/invoicewidget.dart';
import 'package:gomart/utils/svg_string.dart';
import 'package:google_fonts/google_fonts.dart';

import '../component/icon.dart';

class Invoicepg extends StatefulWidget {
  final item;
  final value;

  const Invoicepg({
    super.key,
    this.item,
    this.value,
  });

  @override
  State<Invoicepg> createState() => _InvoicepgState();
}

class _InvoicepgState extends State<Invoicepg> {
  var orderController = Get.put(OrderController());
  var totalQty = 0;
  var totalprice = 0;
  var sum = 0.0;
  var tax = 0.0;
  var disamount = 0.0;
  var amount = 0.0;
  var totalamount = 0.0;

  totalqtymethod() {
    var qty = 0;
    for (int i = 0; i < widget.value.length; i++) {
      qty = qty + int.parse(widget.value[i].itemQuantity);
      print("qty" + qty.toString());
      print("total" + widget.value[i].itemQuantity);
    }
    totalQty = qty;
    setState(() {});
  }

  totalpricemethod() {
    var price = 0;
    for (int i = 0; i < widget.value.length; i++) {
      price = price + int.parse(widget.value[i].itemPrice);
    }
    totalprice = price;
    setState(() {});
  }

  totalpricepayable() {
    if (widget.value.length > 0) {
      tax = totalprice * 8 / 100;
      amount = totalprice + tax;
      disamount = amount * 5 / 100;
      totalamount = totalprice + tax - disamount;
    } else {
      sum = 0.0;
      tax = 0.0;
      disamount = 0.0;
      totalamount = 0.0;
      setState(() {});
    }
  }

  // totalSingleItemPrice() {

  // }

  @override
  void initState() {
    print(widget.item.toString());
    Future.delayed(Duration(microseconds: 300), () {
      totalqtymethod();
      totalpricemethod();
      totalpricepayable();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Mybackground(
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.string(arrowback)),
                    Container(
                        child: Text(
                      'Order',
                      style: TextStyle(
                        color: Color(0xFF3F2037),
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    )),
                    Myicon(onTap: () {
                      Navigator.pushNamed(context, "cart");
                    }),
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 110.w,
                  ),
                  Container(
                    child: Text(
                      'Order : ' + widget.item.orderNo,
                      style: TextStyle(
                        color: Color(0xFF575C55),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Download',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF1E9DC2),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: 400.w,
                        height: 400.h,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: ScreenUtil().setWidth(15)),
                              child: Row(
                                children: [
                                  Text(
                                    "Order List",
                                    style: TextStyle(
                                      color: Color(0xFF7C7C7C),
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Product",
                                  style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff7C7C7C))),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: ScreenUtil().setWidth(25)),
                                  child: Text(
                                    "In Unit",
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff7C7C7C))),
                                  ),
                                ),
                                Text(
                                  "Qty",
                                  style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff7C7C7C))),
                                ),
                                Text(
                                  "Rate",
                                  style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff7C7C7C))),
                                ),
                                Text(
                                  "Total",
                                  style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff7C7C7C))),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                              child: Divider(thickness: .5),
                            ),
                            Expanded(
                              child: ListView.separated(
                                itemCount: widget.value.length,
                                itemBuilder: (context, index) {
                                  return InvoiceWidget(
                                    name: widget.value[index].itemName,
                                    qty: widget.value[index].itemQuantity,
                                    price: widget.value[index].itemPrice,
                                    totalprice: '',
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return Divider(
                                    thickness: .5,
                                    endIndent: 10,
                                    indent: 10,
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 50.w,
                                ),
                                Text(
                                  "Total Qty: " + totalQty.toString(),
                                  style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                          color: Color(0xFF7C7C7C),
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600)),
                                ),
                                SizedBox(
                                  width: 30.w,
                                ),
                                Text(
                                  "Sub Total :" + totalprice.toString(),
                                  style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                          color: Color(0xFF7C7C7C),
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600)),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: ShapeDecoration(
                          color: Colors.white.withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 1, color: Color(0xFFE2E2E2)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x00000000),
                              blurRadius: 12,
                              offset: Offset(1, 6),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 15, top: 5),
                                  child: Text('Customer Name',
                                      style: TextStyle(
                                        color: Color(0xFF828282),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      )),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 135, top: 5),
                                  child: Text("Order on",
                                      style: TextStyle(
                                        color: Color(0xFF828282),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      )),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(widget.item.name,
                                      style: TextStyle(
                                        color: Color(0xFF828282),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      )),
                                  Text(widget.item.orderDate,
                                      style: TextStyle(
                                        color: Color(0xFF828282),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ))
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 15),
                                  child: Text("Pick Up Address",
                                      style: TextStyle(
                                        color: Color(0xFF828282),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      )),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(widget.item.address,
                                      style: TextStyle(
                                        color: Color(0xFF828282),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      )),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Mycartbill(
                        text: totalprice.toString(),
                        text1: disamount.toString(),
                        tax2: tax.toString(),
                        text4: totalamount.toString(),
                      )
                    ],
                  ),
                ),
              )
            ])),
      ),
    );
  }
}
