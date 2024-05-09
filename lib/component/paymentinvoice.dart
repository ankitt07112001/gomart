import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomart/api_controller/url.dart';

class Invoicepayment extends StatefulWidget {
  final price;
  final imagepath;
  final name;
  final qty;

  const Invoicepayment(
      {super.key,
      required this.price,
      required this.imagepath,
      required this.name,
      required this.qty});

  @override
  State<Invoicepayment> createState() => _InvoicepaymentState();
}

class _InvoicepaymentState extends State<Invoicepayment> {
  String valuechoose = "1kg";

  List Listitem = ["1kg", "2kg", "3kg", "4kg"];
  int quantityCount = 1;
  double amount = 0;
  double totalAmount = 0;

  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
    totalAmountfun();
  }

  void decrementQuantity() {
    setState(() {
      if (quantityCount > 1) {
        quantityCount--;
      }
    });
    totalAmountfun();
  }

  void totalAmountfun() {
    setState(() {
      totalAmount = (double.parse(widget.price.toString()) * quantityCount);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.w,
      height: 110.h,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: Colors.grey.shade300)),
      child: Row(
        children: [
          Image.network(
            imageurl + widget.imagepath,
            // scale: 0.4
            // height: 40,
            width: 100.w,
          ),
          SizedBox(
            width: 5.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80.w,
                child: Text(
                  widget.name,
                  style: TextStyle(
                    color: Color(0xFF575C55),
                    fontSize: 16.sp,
                    fontFamily: 'Be Vietnam',
                    fontWeight: FontWeight.w700,
                    height: 0,
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
          Padding(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(15)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: ScreenUtil().setHeight(50)),
                  child: Text(
                    'Quantity',
                    style: TextStyle(
                      color: Color(0xFF7C7C7C),
                      fontSize: 16.sp,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  widget.qty,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF7C7C7C),
                    fontSize: 16.sp,
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(40),
                left: ScreenUtil().setWidth(15)),
            child: Text(
              '\$' + widget.price,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontFamily: 'Be Vietnam',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
