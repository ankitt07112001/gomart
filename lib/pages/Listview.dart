import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

// import 'package:go_mart/model/ordertile.dart';
// import 'package:go_mart/widget/Navigation_bar.dart';
// import 'package:go_mart/widget/offer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gomart/api_controller/OrderController.dart';
import 'package:gomart/component/backgroundcontainer.dart';
import 'package:gomart/component/icon.dart';
import 'package:gomart/pages/cart.dart';
import 'package:gomart/utils/svg_string.dart';
import 'package:shimmer/shimmer.dart';
import '../component/Shimmer/slidableShimmer.dart';
import '../component/offer.dart';
import '../model/ordertile.dart';
import 'mainscreen.dart';
import 'orderinvoicepg.dart';

class Mylistview extends StatefulWidget {
  const Mylistview({
    super.key,
  });

  @override
  State<Mylistview> createState() => _MylistviewState();
}

class _MylistviewState extends State<Mylistview> {
  var orderController = Get.put(OrderController());

  @override
  void initState() {
    orderController.getOrderDetailApi();
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
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.string(arrowback)),
                  Text(
                    "Order",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Color(0xff3F2037),
                    ),
                  ),
                  Myicon(onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Mycart(visible: true)));
                  }),
                ],
              ),
            ),
            Expanded(
              // height: double.infinity,
              child: Obx(
                () => orderController.isLoadingGetOrder == true
                    ? Shimmer.fromColors(
                        // direction: ShimmerDirection.ttb,
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade50,
                        enabled: true,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: orderController.GetOrderList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SingleChildScrollView(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  Orderinvoicepg()));
                                    },
                                    child: Card(
                                      color: Colors.white70.withOpacity(0.8),
                                      semanticContainer: true,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Order : ",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Color(0xff575C55)),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 50),
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.4,
                                                    child: Text(
                                                      orderController
                                                          .GetOrderList[index]
                                                          .orderNo,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Color(
                                                              0xff575C55)),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                    "\$" +
                                                        orderController
                                                            .GetOrderList[index]
                                                            .orderAmount,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            Color(0xff838383))),
                                              ],
                                            ),
                                            Text(
                                                orderController
                                                    .GetOrderList[index].name
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xff838383))),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text("Pick Up Address",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xff575C55))),
                                            Text(
                                                orderController
                                                    .GetOrderList[index].address
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xff838383))),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("Order on",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            Color(0xff575C55))),
                                                Text("Order Status",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            Color(0xff575C55))),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    orderController
                                                        .GetOrderList[index]
                                                        .orderDate
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            Color(0xff838383))),
                                                Text("Ready to Deliver",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            Color(0xff838383)))
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: orderController.GetOrderList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SingleChildScrollView(
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => Orderinvoicepg(
                                                    orderno: orderController
                                                        .GetOrderList[index],
                                                  )));
                                    },
                                    child: Obx(
                                      () => orderController.isLoadingDelete ==
                                              true
                                          ? SlidableShimmer()
                                          : Slidable(
                                              endActionPane: ActionPane(
                                                motion: const StretchMotion(),
                                                children: [
                                                  SlidableAction(
                                                      backgroundColor:
                                                          Colors.green,
                                                      icon: Icons.delete,
                                                      label: "Cancel Order",
                                                      onPressed: (context) {
                                                        orderController
                                                            .cancelOrderApi(
                                                                orderController
                                                                    .GetOrderList[
                                                                        index]
                                                                    .orderNo);
                                                      })
                                                ],
                                              ),
                                              startActionPane: ActionPane(
                                                motion: const StretchMotion(),
                                                children: [
                                                  SlidableAction(
                                                      backgroundColor:
                                                          Colors.red,
                                                      icon: Icons.delete,
                                                      label: "delete order",
                                                      onPressed: (context) {
                                                        orderController
                                                            .deleteOrderApi(
                                                                orderController
                                                                    .GetOrderList[
                                                                        index]
                                                                    .orderNo,
                                                                index);
                                                        orderController
                                                                .GetOrderList
                                                            .removeAt(index);
                                                        setState(() {});
                                                      })
                                                ],
                                              ),
                                              child: Card(
                                                color: Colors.white70
                                                    .withOpacity(0.8),
                                                semanticContainer: true,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "Order : ",
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Color(
                                                                    0xff575C55)),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    right: 50),
                                                            child: Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.4,
                                                              child: Text(
                                                                orderController
                                                                    .GetOrderList[
                                                                        index]
                                                                    .orderNo,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Color(
                                                                        0xff575C55)),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                              "\$" +
                                                                  orderController
                                                                      .GetOrderList[
                                                                          index]
                                                                      .orderAmount,
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Color(
                                                                      0xff838383))),
                                                        ],
                                                      ),
                                                      Text(
                                                          orderController
                                                              .GetOrderList[
                                                                  index]
                                                              .name
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Color(
                                                                  0xff838383))),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text("Pick Up Address",
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Color(
                                                                  0xff575C55))),
                                                      Text(
                                                          orderController
                                                              .GetOrderList[
                                                                  index]
                                                              .address
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Color(
                                                                  0xff838383))),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text("Order on",
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Color(
                                                                      0xff575C55))),
                                                          Text("Order Status",
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Color(
                                                                      0xff575C55))),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                              orderController
                                                                  .GetOrderList[
                                                                      index]
                                                                  .orderDate
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Color(
                                                                      0xff838383))),
                                                          Text(
                                                              "Ready to Deliver",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Color(
                                                                      0xff838383)))
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                    )),
                              ));
                        }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
