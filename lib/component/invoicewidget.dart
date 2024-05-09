import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class InvoiceWidget extends StatelessWidget {
  final name;
  final qty;
  final price;
  final totalprice;
  const InvoiceWidget(
      {super.key,
      required this.name,
      required this.qty,
      required this.price,
      required this.totalprice});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            // height: 30.h,
            width: 80.w,
            child: Text(
              name,
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      color: Color(0xFF7C7C7C),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600)),
              softWrap: true,
            ),
          ),
          Text(
            "1kg",
            style: GoogleFonts.openSans(
                textStyle: TextStyle(
                    color: Color(0xFF7C7C7C),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600)),
          ),
          Text(
            "x",
            style: GoogleFonts.openSans(
                textStyle: TextStyle(
                    color: Color(0xFF7C7C7C),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600)),
          ),
          Text(
            qty,
            style: GoogleFonts.openSans(
                textStyle: TextStyle(
                    color: Color(0xFF7C7C7C),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600)),
            textAlign: TextAlign.start,
          ),
          Text(
            "\$" + price,
            style: GoogleFonts.openSans(
                textStyle: TextStyle(
                    color: Color(0xFF7C7C7C),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600)),
          ),
          Text(
            totalprice,
            style: GoogleFonts.openSans(
                textStyle: TextStyle(
                    color: Color(0xFF7C7C7C),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600)),
          )
        ],
      ),
    );
  }
}
