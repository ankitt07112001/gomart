import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gomart/api_controller/url.dart';
import 'package:gomart/component/food_tile.dart';
import 'package:gomart/component/fooddetails.dart';
import 'package:gomart/component/productWidget.dart';
import 'package:gomart/model/foodinfo.dart';
import 'package:gomart/pages/explore.dart';
import 'package:gomart/pages/searchbar.dart';
import 'package:google_fonts/google_fonts.dart';
import '../api_controller/CateogoryController.dart';
import '../api_controller/ProductController.dart';
import '../api_controller/cartController.dart';
import '../api_controller/controller.dart';
import '../component/Shimmer/ProductWidgetShimmer.dart';
import '../component/icon.dart';
import 'catdetail.dart';
import 'cateogirieslistpg.dart';
import 'foodalldetails.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shimmer/shimmer.dart';
import 'grocerydetail.dart';
import 'grosery.dart';

class Myhome extends StatefulWidget {
  const Myhome({super.key});

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  var box = GetStorage();
  List imageList = [
    {"id": 1, "image_path": 'assets/images/offer.png'},
    {"id": 2, "image_path": 'assets/images/offer.png'},
    {"id": 3, "image_path": 'assets/images/offer.png'}
  ];
  final CarouselController carouselController = CarouselController();
  var LoginController = Get.put(Controller());
  var CatController = Get.put(CateogoryController());
  var ProController = Get.put(ProductController());
  var cartController = Get.put(CartController());
  int currentIndex = 0;
  List GroceryList = [
    {
      "id": 1,
      "imagepath": "assets/listimages/grain1.png",
      "name": "Pulses",
      "color": Color(0xffF8A44C).withOpacity(.15),
    },
    {
      "id": 2,
      "imagepath": "assets/listimages/grain2.png",
      "name": "Rice",
      "color": Color(0xff53B175).withOpacity(.15),
    },
    {
      "id": 3,
      "imagepath": "assets/listimages/grain1.png",
      "name": "Wheat",
      "color": Color(0xffF8A44C).withOpacity(.15)
    },
  ];

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 200), () {
      LoginController.banner();
      CatController.cateogoryapi();
      ProController.productApi();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          SizedBox(
            height: 40.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 38.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image(
                      alignment: Alignment.topLeft,
                      image: AssetImage(
                        "assets/images/profile.png",
                      ),
                      height: 50.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(box.read("user_name").toString(),
                      style: GoogleFonts.dmSans(
                        textStyle: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                ]),
                Myicon(
                  onTap: () {
                    Navigator.pushNamed(context, "cart");
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Mysearch()));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 40.w),
              child: TextField(
                enabled: false,
                keyboardType: TextInputType.none,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(color: Colors.black12))),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                Obx(
                  () => LoginController.isLoadingSlide.value == true
                      ? Shimmer.fromColors(
                          // direction: ShimmerDirection.ttb,
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade50,
                          enabled: true,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            width: 400,
                            height: 180,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                border: Border.all(color: Colors.grey.shade50),
                                borderRadius: BorderRadius.circular(20)),
                          ))
                      : InkWell(
                          onTap: () {
                            print(currentIndex);
                          },
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 15),
                                height: 180,
                                width: 400,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: CarouselSlider(
                                    items: LoginController.carouselList
                                        .map(
                                          (e) => Image.network(
                                            imageurl + e.bannerImage,
                                            fit: BoxFit.cover,
                                            // Use BoxFit.cover to ensure the image covers the entire container
                                            width: 400,
                                          ),
                                        )
                                        .toList(),
                                    carouselController: carouselController,
                                    options: CarouselOptions(
                                      scrollPhysics:
                                          const BouncingScrollPhysics(),
                                      autoPlay: true,
                                      autoPlayInterval:
                                          const Duration(seconds: 3),
                                      aspectRatio: 2,
                                      viewportFraction: 1,
                                      onPageChanged: (index, reason) {
                                        setState(() {
                                          currentIndex = index;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 20,
                                left: 0,
                                right: 0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:
                                      imageList.asMap().entries.map((entry) {
                                    return GestureDetector(
                                      onTap: () => carouselController
                                          .animateToPage(entry.key),
                                      child: Container(
                                        width:
                                            currentIndex == entry.key ? 17 : 7,
                                        height: 7.0,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 3.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: currentIndex == entry.key
                                              ? Colors.white
                                              : Color(0xffFFB8A1),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Categories",
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                fontSize: 20,
                                color: Color(0xff575C55),
                                fontWeight: FontWeight.w700),
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => categorie()));
                          },
                          child: Text(
                            "See all",
                            style: TextStyle(fontSize: 15, color: Colors.green),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 100,
                  child: Obx(
                    () => CatController.isLoadingcat.value == true
                        ? Shimmer.fromColors(
                            // direction: ShimmerDirection.ttb,
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade50,
                            enabled: true,
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemCount: 4,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return CircleAvatar(
                                  backgroundColor: Colors.white.withOpacity(.8),
                                  radius: 60,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: 5,
                                );
                              },
                            ),
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            itemCount: CatController.CategoryList.length < 4
                                ? CatController.CategoryList.length
                                : 4,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Mycatdetail(
                                                title: CatController
                                                    .CategoryList[index],
                                              )));
                                },
                                child: Card(
                                  color: Colors.white,
                                  elevation: 5,
                                  shadowColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.network(
                                      imageurl +
                                          CatController.CategoryList[index]
                                              .categoryImage,
                                      fit: BoxFit.cover,
                                      // Use BoxFit.cover to ensure the image covers the entire Card
                                      // height: 70,
                                      // width: 70,
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: 5,
                              );
                            },
                          ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Groceries",
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                fontSize: 20,
                                color: Color(0xff575C55),
                                fontWeight: FontWeight.w700),
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Mygrosery()));
                          },
                          child: Text(
                            "See all",
                            style: TextStyle(fontSize: 15, color: Colors.green),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 100,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Mygrocerydetail(
                                            text: GroceryList[index]["name"],
                                          )));
                            },
                            child: Food_tile(
                                color: GroceryList[index]["color"],
                                imagepath: GroceryList[index]["imagepath"],
                                text: GroceryList[index]["name"]),
                          ),
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 5,
                        );
                      },
                      itemCount: GroceryList.length),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Exclusive Offer",
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                fontSize: 20,
                                color: Color(0xff575C55),
                                fontWeight: FontWeight.w700),
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => Myexplore(
                                        // title: ,
                                        )));
                          },
                          child: Text(
                            "See all",
                            style: TextStyle(fontSize: 15, color: Colors.green),
                          ))
                    ],
                  ),
                ),
                Obx(
                  () => ProController.productLoading == true
                      ? ProductWidgetShimmer()
                      : GridView.builder(
                          itemCount: ProController.ProductList.length > 4
                              ? 4
                              : ProController.ProductList.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: .9,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            final item = ProController.ProductList[index];
                            return ProductWidget(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => Myalldetails(
                                              imagepath: item,
                                              price: item.itemPrice,
                                              name: item.itemName,
                                              description: item.itemDescription,
                                            )));
                              },
                              imagepath: item,
                              price: item.itemPrice,
                              productname: item.itemName,
                              addtoCart: () {
                                cartController.cartApi(item, 1);
                                // cartController.cartLength + 1;
                              },
                            );
                          }),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
