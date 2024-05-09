import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gomart/api_controller/controller.dart';
import 'package:gomart/api_controller/url.dart';
import 'package:gomart/model/favoriteprovider.dart';
import 'package:gomart/model/foodlist.dart';
import 'package:gomart/utils/svgstring.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../api_controller/FavouriteController.dart';
import '../model/foodinfo.dart';

class ProductWidget extends StatefulWidget {
  final Function()? onTap;
  final Function()? addtoCart;
  final imagepath;
  final productname;
  final price;
  const ProductWidget({
    super.key,
    required this.onTap,
    required this.imagepath,
    required this.productname,
    required this.price,
    required this.addtoCart,
  });

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  bool isFav = false;
  var myController = Get.put(Controller());
  var favController = Get.put(FavouriteController());
  int quantity = 1;
  String valuechoose = "1kg";
  List Listitem = ["1kg", "2kg", "3kg", "4kg"];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.r)),
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          SizedBox(
            height: 5.h,
          ),
          InkWell(
            onTap: widget.onTap,
            child: Image.network(
              imageurl + widget.imagepath.itemImage,
              height: 96.h,
              width: 139.w,
              // scale: .3,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            widget.productname,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
              color: Color(0xff181725),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            width: 130.w,
            height: 30.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black12),
            ),
            child: Center(
              child: DropdownButton(
                  underline: Container(
                    color: Colors.white,
                  ),
                  value: valuechoose,
                  items: Listitem.map((valueitem) {
                    return DropdownMenuItem(
                        value: valueitem,
                        child: Text(
                          valueitem,
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff7C7C7C))),
                        ));
                  }).toList(),
                  onChanged: (newvalue) {
                    setState(() {
                      valuechoose = newvalue.toString();
                    });
                  }),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isFav = !isFav;
                      });

                      favController.favouriteApi(
                          widget.imagepath.itemId, isFav);
                    },
                    child: Container(
                      height: 29.h,
                      width: 30.w,
                      child: SvgPicture.string(
                        bookmark,
                        color: isFav == true ? Colors.green : null,
                      ),
                    ),
                  ),
                  Text("\$" + widget.price,
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w600),
                      )),
                ],
              ),
              InkWell(
                onTap: widget.addtoCart,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff23AA49),
                      borderRadius: BorderRadius.circular(10)),
                  height: 27.h,
                  width: 44.w,
                  child: Center(
                      child: FaIcon(
                    FontAwesomeIcons.plus,
                    color: Colors.white,
                    size: 20.h,
                  )),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
