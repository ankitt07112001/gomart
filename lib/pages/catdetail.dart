import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gomart/api_controller/cartController.dart';
import 'package:gomart/api_controller/controller.dart';
import 'package:gomart/component/backgroundcontainer.dart';
import 'package:gomart/component/icon.dart';
import 'package:gomart/model/foodinfo.dart';
import 'package:gomart/pages/cart.dart';
import 'package:gomart/component/productWidget.dart';
import 'package:shimmer/shimmer.dart';
import '../api_controller/CateogoryController.dart';
import '../api_controller/url.dart';
import '../component/Shimmer/ProductWidgetShimmer.dart';
import '../component/fooddetails.dart';
import '../utils/svg_string.dart';
import 'foodalldetails.dart';

class Mycatdetail extends StatefulWidget {
  final title;

  const Mycatdetail({super.key, required this.title});

  @override
  State<Mycatdetail> createState() => _MycatdetailState();
}

class _MycatdetailState extends State<Mycatdetail> {
  var isfav = false;
  var myController = Get.put(CateogoryController());
  var cartController = Get.put(CartController());

  @override
  void initState() {
    // print("DATATTA" + widget.title.catId.toString());

    myController.getProduct(widget.title.catId);
    // cartController.getCartApi();
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
            height: 35.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.string(arrowback)),
              Text(
                widget.title.categoryName,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 26.sp),
              ),
              Myicon(onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Mycart(
                              visible: true,
                            )));
              })
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  top: ScreenUtil().setHeight(20),
                ),
                child: Column(
                  children: [
                    Obx(
                      () => myController.getProductLoader == true
                          ? ProductWidgetShimmer()
                          : GridView.builder(
                              itemCount: myController.GetProduct.length,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: .9,
                                mainAxisSpacing: 20,
                              ),
                              itemBuilder: (context, index) {
                                return ProductWidget(
                                  onTap: () {
                                    Get.to(Myalldetails(
                                      imagepath: myController.GetProduct[index],
                                      name: myController
                                          .GetProduct[index].itemName,
                                      price: myController
                                          .GetProduct[index].itemPrice,
                                      description: myController
                                          .GetProduct[index].itemDescription,
                                    ));
                                  },
                                  imagepath: myController.GetProduct[index],
                                  productname:
                                      myController.GetProduct[index].itemName,
                                  price:
                                      myController.GetProduct[index].itemPrice,
                                  addtoCart: () {
                                    cartController.cartApi(
                                        myController.GetProduct[index], 1);

                                    cartController.getCartApi();

                                    cartController.getCartItem.length;
                                  },
                                  // ontapFav: null,
                                );
                              }),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
