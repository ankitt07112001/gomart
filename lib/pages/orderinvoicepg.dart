import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gomart/component/Shimmer/ShimmerWidget.dart';
import 'package:gomart/component/backgroundcontainer.dart';
import 'package:gomart/component/cart_bill.dart';
import 'package:gomart/utils/svg_string.dart';
import '../api_controller/OrderController.dart';
import '../component/icon.dart';
import '../component/paymentinvoice.dart';
import 'invoicepg.dart';

class Orderinvoicepg extends StatefulWidget {
  final orderno;

  const Orderinvoicepg({
    super.key,
    this.orderno,
  });

  @override
  State<Orderinvoicepg> createState() => _OrderinvoicepgState();
}

class _OrderinvoicepgState extends State<Orderinvoicepg> {
  var orderController = Get.put(OrderController());
  var sum = 0.0;
  var tax = 0.0;
  var disamount = 0.0;
  var amount = 0.0;
  var totalamount = 0.0;

  totalprice() {
    if (orderController.ListByOrderNum.length > 0) {
      for (int i = 0; i < orderController.ListByOrderNum.length; i++) {
        int itemPrice =
            int.parse(orderController.ListByOrderNum[i].itemPrice.toString());
        amount = amount + itemPrice;
      }

      sum = amount;

      tax = amount * 8 / 100;
      amount = amount + tax;
      disamount = amount * 5 / 100;
      totalamount = sum + tax - disamount;
      setState(() {});
    } else {
      sum = 0.0;
      tax = 0.0;
      disamount = 0.0;
      totalamount = 0.0;
      setState(() {});
    }
  }

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 200), () {
      orderController
          .getOrderByorderNoApi(widget.orderno.orderNo)
          .then((value) {
        totalprice();
      });
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
              padding: EdgeInsets.symmetric(horizontal: 15.w),
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
                      fontSize: 24,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 70,
                ),
                Text(
                  "Order no: " + widget.orderno.orderNo,
                  style: TextStyle(
                    color: Color(0xFF575C55),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Invoicepg(
                                  item: widget.orderno,
                                  value: orderController.ListByOrderNum,
                                )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      'Invoice',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF1E9DC2),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [
                  Column(
                    children: [
                      Obx(
                        () => orderController.isLoadingByOrder == true
                            ? ShimmerWidgetCart()
                            : ListView.separated(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount:
                                    orderController.ListByOrderNum.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  print(
                                    orderController
                                        .ListByOrderNum[index].itemQuantity
                                        .toString(),
                                  );
                                  return Invoicepayment(
                                    price: orderController
                                        .ListByOrderNum[index].itemPrice,
                                    imagepath: orderController
                                        .ListByOrderNum[index].itemImage,
                                    name: orderController
                                        .ListByOrderNum[index].itemName,
                                    qty: orderController
                                        .ListByOrderNum[index].itemQuantity
                                        .toString(),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: 8,
                                  );
                                },
                              ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        // width: double.infinity,
                        height: 140,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey.withOpacity(.2)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.orderno.name.toString(),
                                  style: TextStyle(
                                    color: Color(0xFF828282),
                                    fontSize: 16,
                                    fontFamily: 'Be Vietnam',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Order on',
                                      style: TextStyle(
                                        color: Color(0xFF828282),
                                        fontSize: 16,
                                        fontFamily: 'Be Vietnam',
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Pick Up Address',
                                  style: TextStyle(
                                    color: Color(0xFF828282),
                                    fontSize: 16,
                                    fontFamily: 'Be Vietnam',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                                Text(
                                  widget.orderno.orderDate.toString(),
                                  style: TextStyle(
                                    color: Color(0xFF828282),
                                    fontSize: 16,
                                    fontFamily: 'Be Vietnam',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.orderno.address.toString(),
                                  style: TextStyle(
                                    color: Color(0xFF828282),
                                    fontSize: 16,
                                    fontFamily: 'Be Vietnam',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Order Status',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Color(0xFF828282),
                                    fontSize: 16,
                                    fontFamily: 'Be Vietnam',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                                Text(
                                  'On the way',
                                  style: TextStyle(
                                    color: Color(0xFF969899),
                                    fontSize: 16,
                                    fontFamily: 'Be Vietnam',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                                Text(
                                  'Est. 10 Min',
                                  style: TextStyle(
                                    color: Color(0xFF969899),
                                    fontSize: 16,
                                    fontFamily: 'Be Vietnam',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Order placed',
                                  style: TextStyle(
                                    color: Color(0xFF23AA49),
                                    fontSize: 16,
                                    fontFamily: 'Be Vietnam',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                                Text(
                                  'On the way',
                                  style: TextStyle(
                                    color: Color(0xFF969899),
                                    fontSize: 16,
                                    fontFamily: 'Be Vietnam',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                                Text(
                                  'Delivered',
                                  style: TextStyle(
                                    color: Color(0xFF969899),
                                    fontSize: 16,
                                    fontFamily: 'Be Vietnam',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 4,
                                  width: 100,
                                  color: Colors.green,
                                ),
                                Container(
                                  height: 4,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Colors.green, Colors.white],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      stops: [0.0, 1.0],
                                      transform: GradientRotation(45 *
                                          3.1415926535 /
                                          180), // Rotate the gradient if needed
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 4,
                                  width: 100,
                                  color: Color(0xffE0E0E0),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Mycartbill(
                        text: sum.toString(),
                        text1: disamount.toString(),
                        tax2: tax.toString(),
                        text4: totalamount.toString(),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ]),
              ),
            ),
          ])),
    ));
  }
}
