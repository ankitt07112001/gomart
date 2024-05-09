import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gomart/api_controller/OrderController.dart';
import 'package:google_fonts/google_fonts.dart';

class Mycartbill extends StatefulWidget {
  final String text;
  final text1;
  final tax2;
  final text4;
  const Mycartbill(
      {super.key,
      required this.text,
      required this.text1,
      required this.tax2,
      required this.text4});

  @override
  State<Mycartbill> createState() => _MycartbillState();
}

class _MycartbillState extends State<Mycartbill> {
  var orderCOntroller = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10.r)),
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      height: 150.h,
      // width: 400,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          // crossAxisAlignment: CrossAxisAlignment.spa,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sub Total",
                    style: GoogleFonts.beVietnamPro(
                      textStyle: TextStyle(
                          color: Color(0xff838383),
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp),
                    )),
                Text("\$" + widget.text,
                    style: GoogleFonts.beVietnamPro(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Tax 8%",
                    style: GoogleFonts.beVietnamPro(
                      textStyle: TextStyle(
                          color: Color(0xff838383),
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp),
                    )),
                Text("\$" + "+" + widget.tax2,
                    style: GoogleFonts.beVietnamPro(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 23.h,
                    width: 103.w,
                    child: Text("Discount 5%",
                        style: GoogleFonts.beVietnamPro(
                          textStyle: TextStyle(
                              color: Color(0xff838383),
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp),
                        ))),
                Text("\$" + "-" + widget.text1,
                    style: GoogleFonts.beVietnamPro(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp),
                    )),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Payable Amount",
                  style: GoogleFonts.beVietnamPro(
                      textStyle: TextStyle(
                          color: Color(0xff1E9DC2),
                          fontWeight: FontWeight.w600,
                          fontSize: 20.sp)),
                ),
                Text("\$" + widget.text4,
                    style: GoogleFonts.beVietnamPro(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
