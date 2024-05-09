import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gomart/api_controller/url.dart';
import 'package:gomart/component/Shimmer/ProductWidgetShimmer.dart';
import 'package:gomart/component/icon.dart';
import 'package:gomart/component/productWidget.dart';
import 'package:gomart/model/fillter.dart';
import 'package:gomart/pages/profile_desing.dart';
import 'package:gomart/pages/searchbar.dart';
import 'package:gomart/utils/svgstring.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../api_controller/ProductController.dart';
import '../api_controller/cartController.dart';
import '../component/fooddetails.dart';
import '../component/backgroundcontainer.dart';
import '../model/api_model/productModel.dart';
import '../model/foodinfo.dart';
import '../model/foodlist.dart';
import '../utils/svg_string.dart';
import 'foodalldetails.dart';
import 'mainscreen.dart';

class Myexplore extends StatefulWidget {
  // final title;
  final visible;

  const Myexplore({
    super.key,
    this.visible = true,
    /*this.title*/
  });

  @override
  State<Myexplore> createState() => _MyexploreState();
}

class _MyexploreState extends State<Myexplore> {
  var cartController = Get.put(CartController());
  var productController = Get.put(ProductController());
  List fillterList = [
    Fillterlist(
      title: 'Eggs',
      status: true,
    ),
    Fillterlist(title: 'Noodles & Pasta', status: false),
    Fillterlist(title: 'Chips & Crisps', status: false),
    Fillterlist(title: 'Fast Food', status: false),
    Fillterlist(title: 'Eggs', status: true),
    Fillterlist(title: 'Noodles & Pasta', status: false),
    Fillterlist(title: 'Chips & Crisps', status: false),
    Fillterlist(title: 'Fast Food', status: false),
    Fillterlist(title: 'Eggs', status: true),
    Fillterlist(title: 'Noodles & Pasta', status: false),
    Fillterlist(title: 'Chips & Crisps', status: false),
    Fillterlist(title: 'Fast Food', status: false),
    Fillterlist(title: 'Eggs', status: true),
    Fillterlist(title: 'Noodles & Pasta', status: false),
    Fillterlist(title: 'Chips & Crisps', status: false),
    Fillterlist(title: 'Fast Food', status: false),
    Fillterlist(title: 'Eggs', status: true),
    Fillterlist(title: 'Noodles & Pasta', status: false),
    Fillterlist(title: 'Chips & Crisps', status: false),
    Fillterlist(title: 'Fast Food', status: false),
    Fillterlist(title: 'Eggs', status: true),
    Fillterlist(title: 'Noodles & Pasta', status: false),
    Fillterlist(title: 'Chips & Crisps', status: false),
    Fillterlist(title: 'Fast Food', status: false),
  ];

  bool? isChecked = false;

  @override
  void initState() {
    // print("title" + widget.title.toString());
    // productController.getProductApi(widget.title.itemId);
    // final shop = context.read<Shop>();
    // final foodmenu = shop.Detailslist;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodmenu = shop.Detailslist;
    return Mybackground(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          SizedBox(
            height: 60.h,
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
              Text("Vegetable",
                  style: GoogleFonts.openSans(
                    textStyle:
                        TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                      backgroundColor: Colors.white,
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Mysearch()));
                          },
                          child: SvgPicture.string(search))),
                  TextButton(
                      onPressed: () {
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
                                return StatefulBuilder(builder:
                                    (BuildContext context,
                                        StateSetter setState) {
                                  return Container(
                                    child: Column(
                                      // mainAxisSize: MainAxisSize.min,
                                      // crossAxisAlignment: CrossAxisAlignment
                                      //     .stretch,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: CircleAvatar(
                                                radius: 15,
                                                backgroundColor:
                                                    Color(0xff405B7E),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Color(0xffFFFFFF),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Center(
                                              child: Text(
                                                "Fillters",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 18.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Categories",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 22),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Expanded(
                                          child: ListView.builder(
                                              physics: ClampingScrollPhysics(),
                                              controller: scrollController,
                                              shrinkWrap: true,
                                              itemCount: fillterList.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                Fillterlist items =
                                                    fillterList[index];
                                                return Row(
                                                  children: [
                                                    Checkbox(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        7.0)),
                                                        activeColor:
                                                            Colors.green,
                                                        value: items.status,
                                                        onChanged: (newBool) {
                                                          print("tick" +
                                                              isChecked
                                                                  .toString());
                                                          setState(() {
                                                            items.status =
                                                                newBool!;
                                                          });
                                                        }),
                                                    Text(items.title,
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: items.status ==
                                                                    true
                                                                ? Colors.green
                                                                : Colors
                                                                    .black)),
                                                  ],
                                                );
                                              }),
                                        )
                                      ],
                                    ),
                                    height: 1000,
                                    width: 400,
                                  );
                                });
                              }),
                        );
                      },
                      child:
                          Image(image: AssetImage("assets/images/icon.png"))),
                ],
              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Column(
                  children: [
                    Obx(
                      () => productController.productLoading == true
                          ? ProductWidgetShimmer()
                          : GridView.builder(
                              itemCount: productController.ProductList.length,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: .9,
                                mainAxisSpacing: 10,
                              ),
                              itemBuilder: (context, index) {
                                var item = productController.ProductList[index];
                                return ProductWidget(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => Myalldetails(
                                                  imagepath: item,
                                                  description:
                                                      item.itemDescription,
                                                  price: item.itemPrice,
                                                  name: item.itemName,
                                                )));
                                  },
                                  imagepath: item,
                                  productname: item.itemName,
                                  price: item.itemPrice,
                                  addtoCart: () {
                                    cartController.cartApi(item, 1);
                                  },
                                );
                              }),
                    ),
                    SizedBox(
                      height: 15.h,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
