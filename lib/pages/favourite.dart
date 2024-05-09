import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gomart/api_controller/cartController.dart';
import 'package:gomart/model/favoriteprovider.dart';
import 'package:gomart/model/foodinfo.dart';
import 'package:gomart/pages/cart.dart';
import 'package:gomart/utils/svg_string.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../api_controller/FavouriteController.dart';
import '../component/backgroundcontainer.dart';
import '../component/favwidget.dart';
import '../component/icon.dart';
import '../model/foodlist.dart';

class Favourite extends StatefulWidget {
  final visible;

  const Favourite({
    super.key,
    required this.visible,
  });

  @override
  State<Favourite> createState() => _favouriteState();
}

class _favouriteState extends State<Favourite> {
  var FavController = Get.put(FavouriteController());
  var cartController = Get.put(CartController());
  @override
  void initState() {
    FavController.getFavouriteApi();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Mybackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      // onTap: Navigator.pop(context),
                      child: Visibility(
                          visible: widget.visible,
                          child: SvgPicture.string(arrowback))),
                  Text(
                    "Favourite",
                    style: GoogleFonts.beVietnamPro(
                        textStyle: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700)),
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
            ),
            SizedBox(
              height: 10.h,
            ),
            Obx(
              () => Expanded(
                child: FavController.isLoadingGetFav == true
                    ? Shimmer.fromColors(
                        // direction: ShimmerDirection.ttb,
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade50,
                        enabled: true,
                        child: ListView.separated(
                          // scrollDirection: Axis.horizontal,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: FavController.GetfavouriteList.length,
                          itemBuilder: (context, index) {
                            // final Food food = value.favcart[index];
                            final item = FavController.GetfavouriteList[index];
                            print("length" +
                                FavController.GetfavouriteList.length
                                    .toString());
                            return Slidable(
                              startActionPane: ActionPane(
                                motion: const StretchMotion(),
                                children: [
                                  SlidableAction(
                                      backgroundColor: Colors.green,
                                      icon: Icons.delete,
                                      label: "Delete",
                                      onPressed: (context) {
                                        // removeToFav(food, context);
                                      })
                                ],
                              ),
                              child: Myfavwidget(
                                imagepath: FavController
                                    .GetfavouriteList[index].itemImage,
                                name: FavController
                                    .GetfavouriteList[index].itemName,
                                price: FavController
                                    .GetfavouriteList[index].itemPrice,
                                addToCart: () {},
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                              thickness: 1,
                              endIndent: 10,
                              indent: 10,
                            );
                          },
                        ),
                      )
                    : ListView.separated(
                        // scrollDirection: Axis.horizontal,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: FavController.GetfavouriteList.length,
                        itemBuilder: (context, index) {
                          // final Food food = value.favcart[index];
                          final item = FavController.GetfavouriteList[index];
                          print("length" +
                              FavController.GetfavouriteList.length.toString());
                          return Obx(
                            () => FavController.isLoadingDelete == true
                                ? Shimmer.fromColors(
                                    // direction: ShimmerDirection.ttb,
                                    baseColor: Colors.grey.shade300,
                                    highlightColor: Colors.grey.shade50,
                                    enabled: true,
                                    child: Slidable(
                                      startActionPane: ActionPane(
                                        motion: const StretchMotion(),
                                        children: [
                                          SlidableAction(
                                              backgroundColor: Colors.green,
                                              icon: Icons.delete,
                                              label: "Delete",
                                              onPressed: (context) {
                                                FavController.deleteFavApi(
                                                    FavController
                                                        .GetfavouriteList[index]
                                                        .id,
                                                    index);
                                              })
                                        ],
                                      ),
                                      child: Obx(
                                        () => Myfavwidget(
                                          imagepath: FavController
                                              .GetfavouriteList[index]
                                              .itemImage,
                                          name: FavController
                                              .GetfavouriteList[index].itemName,
                                          price: FavController
                                              .GetfavouriteList[index]
                                              .itemPrice,
                                          addToCart: () {},
                                        ),
                                      ),
                                    ))
                                : Slidable(
                                    startActionPane: ActionPane(
                                      motion: const StretchMotion(),
                                      children: [
                                        SlidableAction(
                                            backgroundColor: Colors.green,
                                            icon: Icons.delete,
                                            label: "Delete",
                                            onPressed: (context) {
                                              FavController.deleteFavApi(
                                                  FavController
                                                      .GetfavouriteList[index]
                                                      .id,
                                                  index);
                                            })
                                      ],
                                    ),
                                    child: Obx(
                                      () => Myfavwidget(
                                        imagepath: FavController
                                            .GetfavouriteList[index].itemImage,
                                        name: FavController
                                            .GetfavouriteList[index].itemName,
                                        price: FavController
                                            .GetfavouriteList[index].itemPrice,
                                        addToCart: () {
                                          cartController.cartApi(item, 1);
                                        },
                                      ),
                                    ),
                                  ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            thickness: 1,
                            endIndent: 10,
                            indent: 10,
                          );
                        },
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
