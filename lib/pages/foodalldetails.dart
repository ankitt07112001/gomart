import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gomart/api_controller/url.dart';
import 'package:gomart/component/myrow.dart';
import 'package:gomart/model/favoriteprovider.dart';
import 'package:gomart/utils/svg_string.dart';
import 'package:gomart/utils/svgstring.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../api_controller/FavouriteController.dart';
import '../api_controller/cartController.dart';
import '../api_controller/ratingController.dart';
import '../component/background2.dart';
import '../component/button.dart';
import '../component/cart_component.dart';
import '../component/icon.dart';

class Myalldetails extends StatefulWidget {
  // final ? item;
  // final quantityCount;
  final imagepath;
  final name;
  final description;
  final price;
  const Myalldetails({
    super.key,
    this.imagepath,
    this.name,
    this.description,
    this.price,
    // this.quantityCount = 1,
    // this.item,
  });

  @override
  State<Myalldetails> createState() => _MyalldetailsState();
}

class _MyalldetailsState extends State<Myalldetails> {
  bool isFav = false;
  var myController = Get.put(CartController());
  var ratingController = Get.put(RatingController());
  var favController = Get.put(FavouriteController());
  String valuechoose = "1kg";
  List Listitem = ["1kg", "2kg", "3kg", "4kg"];
  List CartList = [
    {
      "id": 1,
      "imagepath": "assets/details/detailscart1.png",
      "name1": "100%",
      "name2": "Organic"
    },
    {
      "id": 2,
      "imagepath": "assets/details/detailscart2.png",
      "name1": "1 year",
      "name2": "Expiration"
    },
    {
      "id": 3,
      "imagepath": "assets/details/detailscart3.png",
      "name1": "4.8",
      "name2": "Reviews"
    },
    {
      "id": 4,
      "imagepath": "assets/details/detailscart4.png",
      "name1": "80 kcal",
      "name2": "100 gm"
    },
  ];
  int quantityCount = 1;

  int quantity = 0;
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

  double amount = 0;
  double totalAmount = 0;
  void totalAmountfun() {
    setState(() {
      totalAmount = (amount * quantityCount.toDouble());
      print("total amount" + totalAmount.toString());
    });
  }

  @override
  void initState() {
    amount = double.parse(widget.price);
    totalAmount = (amount * quantityCount.toDouble());
    ratingController.ratingApi(widget.imagepath.itemId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Favprovider>(
      builder: (context, value, child) => SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Positioned(
                top: ScreenUtil().setHeight(-176),
                left: ScreenUtil().setWidth(-25),
                // right: -144,
                // bottom: 502,
                child: Mybackground2(),
              ),
              Container(
                child: Column(children: [
                  Myrow(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          height: 245.h,
                          width: 280.w,
                          // color: Colors.red,
                          // color: Colors.red,

                          child: Image.network(
                            imageurl + widget.imagepath.itemImage,
                            scale: 0.7.h,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(right: ScreenUtil().setWidth(28)),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () {
                                favController.favouriteApi(
                                    widget.imagepath, isFav);
                                setState(() {
                                  isFav = !isFav;
                                });
                              },
                              child: Container(
                                  height: 29.h,
                                  width: 30.w,
                                  child: SvgPicture.string(
                                    bookmark,
                                    color: isFav == true ? Colors.green : null,
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: ScreenUtil().setWidth(12)),
                                child: Text(widget.name,
                                    style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w700),
                                    )),
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      child: IconButton(
                                          onPressed: decrementQuantity,
                                          icon: Icon(Icons.remove))),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    quantityCount.toString(),
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.green,
                                    child: IconButton(
                                      onPressed: incrementQuantity,
                                      icon: Icon(Icons.add),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: ScreenUtil().setWidth(30)),
                          child: Row(
                            children: [
                              Container(
                                width: 130.w,
                                height: 30.h,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black12,
                                    ),
                                    borderRadius: BorderRadius.circular(10.r)),
                                child: Center(
                                  child: DropdownButton(
                                      icon: Align(
                                          alignment: Alignment.topRight,
                                          child: Icon(
                                              Icons.arrow_drop_down_sharp)),
                                      underline: Container(
                                        color: Colors.white,
                                      ),
                                      value: valuechoose,
                                      items: Listitem.map((valueitem) {
                                        return DropdownMenuItem(
                                            value: valueitem,
                                            child: Text(valueitem,
                                                style: GoogleFonts.openSans(
                                                  textStyle: TextStyle(
                                                      fontSize: 16.sp,
                                                      color: Color(0xffF7CD41)),
                                                )));
                                      }).toList(),
                                      onChanged: (newvalue) {
                                        setState(() {
                                          valuechoose = newvalue.toString();
                                        });
                                      }),
                                ),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Text("\$" + totalAmount.toString(),
                                  style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xffF7CD41)),
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          width: 350.w,
                          height: 70.h,
                          child: SingleChildScrollView(
                              child: Text(
                            widget.description,
                            style: GoogleFonts.dmSans(
                              textStyle: TextStyle(
                                  color: Color(0xff979899),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp),
                            ),
                          )),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          width: 342.w,
                          height: 200.h,
                          child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: CartList.length,
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 16,
                                      crossAxisSpacing: 16,
                                      childAspectRatio: 2.1.h),
                              itemBuilder: (context, index) {
                                return Mycart_component(
                                  imagepath: CartList[index]["imagepath"],
                                  text1: ratingController.review.toString(),
                                  text2: ratingController.rating.toString(),
                                );
                              }),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Obx(
                          () => Mybutton(
                            isLoading: myController.isLoadingCart.value,
                            text: 'Add to Cart',
                            onTap: () {
                              myController.cartApi(
                                  widget.imagepath, quantityCount);
                              print("price :" +
                                  widget.imagepath.itemPrice.toString());
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        )
                      ]),
                    ),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
