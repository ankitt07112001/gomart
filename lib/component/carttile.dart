import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gomart/api_controller/url.dart';
import 'package:google_fonts/google_fonts.dart';

import '../api_controller/cartController.dart';
import '../model/foodinfo.dart';

class Mycarttile extends StatefulWidget {
  // final item;
  final String imagepath;
  final String text;
  final String price;
  final textquantity;
  final Function increment;
  final Function decrement;
  final void Function()? onTap;
  const Mycarttile(
      {super.key,
      required this.imagepath,
      required this.text,
      required this.price,
      required this.onTap,
      // this.item,
      required this.increment,
      required this.decrement,
      required this.textquantity});

  @override
  State<Mycarttile> createState() => MycarttileState();
}

class MycarttileState extends State<Mycarttile> {
  List Listitem = ["1kg", "2kg", "3kg", "4kg"];
  var cartController = Get.put(CartController());
  String valuechoose = "1kg";
  int quantityCount = 1;
  double amount = 0;
  double totalAmount = 0;
  double newprice = 0;

  void totalAmountfun() {
    setState(() {
      totalAmount = newprice * quantityCount;
    });
  }

  @override
  void initState() {
    setState(() {
      quantityCount = int.parse(widget.textquantity);
    });
    totalAmount = double.parse(widget.price.toString());
    newprice = totalAmount / quantityCount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14.w),
      decoration: BoxDecoration(
          color: Color(0xffE2E2E2).withOpacity(.3),
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: Colors.grey.shade300)),
      width: 400.w,
      height: 110.h,
      child: Row(
        children: [
          Image.network(
            imageurl + widget.imagepath,
            height: 84.h,
            width: 85.w,
            // scale: 0.5.h,
          ),
          SizedBox(
            width: 15.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100.w,
                child: Text(
                  widget.text,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                    color: Color(0xff181725),
                  ),
                  softWrap: true,
                ),
              ),
              Container(
                width: 100.w,
                height: 30.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: Colors.black.withOpacity(.2))),
                child: Center(
                  child: DropdownButton(
                      underline: Container(
                        color: Colors.white,
                      ),
                      value: valuechoose,
                      items: Listitem.map((valueitem) {
                        return DropdownMenuItem(
                            value: valueitem, child: Text(valueitem));
                      }).toList(),
                      onChanged: (newvalue) {
                        setState(() {
                          valuechoose = newvalue.toString();
                        });
                      }),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 20.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: ScreenUtil().setHeight(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                        radius: 15.r,
                        backgroundColor: Colors.grey.shade400,
                        child: IconButton(
                            onPressed: () {
                              var oldprice = newprice * quantityCount;
                              setState(() {
                                if (quantityCount > 1) {
                                  quantityCount--;
                                }
                              });
                              totalAmountfun();
                              widget.decrement!(
                                  quantityCount, newprice, oldprice);
                              // decrementQuantity();
                            },
                            icon: Icon(
                              Icons.remove,
                              size: 16.h,
                            ))),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      quantityCount.toString(),
                      style: GoogleFonts.dmSans(
                          textStyle: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w700)),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    CircleAvatar(
                      radius: 15.r,
                      backgroundColor: Colors.green.shade400,
                      child: IconButton(
                        onPressed: () {
                          var oldprice = newprice * quantityCount;
                          setState(() {
                            quantityCount++;
                          });
                          totalAmountfun();
                          widget.increment!(quantityCount, newprice, oldprice);
                          // incrementQuantity();
                        },
                        icon: Icon(
                          Icons.add,
                          size: 16.h,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // SizedBox(
              //   height: 30,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      height: 29.h,
                      width: 100.w,
                      child: Text("\$" + totalAmount.toStringAsFixed(2),
                          style: GoogleFonts.beVietnamPro(
                              textStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700)))),
                  InkWell(
                    onTap: widget.onTap,
                    child: Padding(
                      padding:
                          EdgeInsets.only(bottom: ScreenUtil().setHeight(8)),
                      child: Image(
                        image: AssetImage("assets/images/delete (2).png"),
                        height: 25.h,
                        width: 35.w,
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
