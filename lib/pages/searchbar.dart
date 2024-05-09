import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gomart/api_controller/cartController.dart';
import 'package:gomart/component/Shimmer/ProductWidgetShimmer.dart';
import 'package:gomart/component/backgroundcontainer.dart';
import 'package:gomart/component/myrow.dart';
import 'package:gomart/component/productWidget.dart';
import 'package:gomart/pages/mainscreen.dart';

import '../api_controller/ProductController.dart';
import '../component/fooddetails.dart';
import '../model/foodinfo.dart';
import '../utils/svg_string.dart';
import 'foodalldetails.dart';
import 'home.dart';

class Mysearch extends StatefulWidget {
  const Mysearch({super.key});

  @override
  State<Mysearch> createState() => _MysearchState();
}

class _MysearchState extends State<Mysearch> {
  var ProController = Get.put(ProductController());
  var cartController = Get.put(CartController());

  List _founduser = [];
  void _runFilter(String enterkeyword) {
    List result = [];
    if (enterkeyword.isEmpty) {
      result = List.from(ProController.ProductList);
    } else {
      result = ProController.ProductList.where((user) =>
              user.itemName.toLowerCase().contains(enterkeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _founduser = result;
    });
  }

  @override
  void initState() {
    ProController.productApi();
    _founduser = ProController.ProductList;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Mybackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Myrow(),
              SizedBox(
                height: 20.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  onChanged: (value) => _runFilter(value),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black12),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                  child: _founduser.isNotEmpty
                      ? GridView.builder(
                          shrinkWrap: true,
                          itemCount: _founduser.length,
                          itemBuilder: (context, index) {
                            // final item = ProController.ProductList[index];
                            final item = _founduser[index];

                            return ProductWidget(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Myalldetails()));
                              },
                              imagepath: item,
                              productname: item.itemName,
                              price: item.itemPrice,
                              addtoCart: () {
                                cartController.cartApi(
                                    ProController.ProductList[index], 1);
                              },
                              // food: _founduser[index],
                            );
                          },
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: .9,
                            mainAxisSpacing: 10,
                          ),
                        )
                      : const Text("No result"))
            ],
          ),
        ),
      ),
    );
  }
}
