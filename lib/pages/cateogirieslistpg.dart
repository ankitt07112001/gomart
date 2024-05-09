import 'package:cached_network_image/cached_network_image.dart';

// import 'package:first_project/Models/categoriesmodel.dart';
// import 'package:first_project/categories/fruit.dart';
// import 'package:first_project/config/svgstring.dart';
// import 'package:first_project/config/url.dart';
// import 'package:first_project/controller/getxcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gomart/api_controller/url.dart';
import 'package:gomart/component/backgroundcontainer.dart';
import 'package:gomart/pages/catdetail.dart';
import 'package:gomart/utils/svg_string.dart';
import 'package:shimmer/shimmer.dart';

import '../api_controller/CateogoryController.dart';
import '../component/icon.dart';
import 'cart.dart';

class categorie extends StatefulWidget {
  const categorie({super.key});

  @override
  State<categorie> createState() => _categorieState();
}

var CatController = Get.put(CateogoryController());

GlobalKey<FormState> _formkey = GlobalKey<FormState>();

class _categorieState extends State<categorie> {
  @override
  void initState() {
    CatController.cateogoryapi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Mybackground(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(children: [
              SizedBox(
                height: 30,
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
                    "Cateogories",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 26),
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
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: CatController.CategoryList.value.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 2.3 / 3, crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Card(
                            color: Colors.white,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Mycatdetail(
                                              title: CatController
                                                  .CategoryList[index])));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(60),
                                  child: CachedNetworkImage(
                                    imageUrl: imageurl +
                                        CatController
                                            .CategoryList[index].categoryImage
                                            .toString(),
                                    // fit: BoxFit.contain,
                                    placeholder: (context, url) => Center(
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        // padding: EdgeInsets.all(50),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: CircularProgressIndicator(
                                          strokeWidth: 3,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.blue),
                                        ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(CatController
                            .CategoryList.value[index].categoryName),
                      ],
                    );
                  },
                ),
              )
            ])));
  }
}
