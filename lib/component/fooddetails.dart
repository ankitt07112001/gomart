import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gomart/api_controller/controller.dart';
import 'package:gomart/model/favoriteprovider.dart';
import 'package:gomart/model/foodlist.dart';
import 'package:gomart/utils/svgstring.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../model/foodinfo.dart';

class Fooddetails extends StatefulWidget {
  final void Function()? onTap;
  final Food food;

  const Fooddetails({
    super.key,
    required this.onTap,
    required this.food,
  });

  @override
  State<Fooddetails> createState() => _FooddetailsState();
}

class _FooddetailsState extends State<Fooddetails> {
  var myController = Get.put(Controller());
  int quantity = 1;
  String valuechoose = "1kg";
  List Listitem = ["1kg", "2kg", "3kg", "4kg"];

  @override
  Widget build(BuildContext context) {
    return Consumer<Favprovider>(
        builder: (context, value, child) => Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    onTap: widget.onTap,
                    child: Image.asset(
                      widget.food.imagepath,
                      height: 96,
                      width: 139,
                      // scale: .3,
                    ),
                  ),
                  Text(
                    widget.food.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Color(0xff181725),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 130,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Center(
                      child: DropdownButton(
                          underline: Container(
                            color: Colors.white,
                          ),
                          // iconEnabledColor: Colors.white,
                          // iconDisabledColor: Colors.white,
                          value: valuechoose,
                          items: Listitem.map((valueitem) {
                            return DropdownMenuItem(
                                value: valueitem, child: Text(valueitem));
                          }).toList(),
                          onChanged: (newvalue) {
                            setState(() {
                              valuechoose = newvalue.toString();
                            });
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                widget.food.isFav = !widget.food.isFav;
                              });
                              if (value.favcart.length < 1) {
                                addToFav();
                              } else {
                                print(widget.food);
                                var add = true;
                                for (int i = 0; i < value.favcart.length; i++) {
                                  if (widget.food.id == value.favcart[i].id) {
                                    value.favcart.removeAt(i);
                                    Get.snackbar("Item",
                                        "Succesfully remove from cart cart");
                                    // Fluttertoast.showToast(
                                    //     msg: "Remove from Favourite",
                                    //     toastLength: Toast.LENGTH_LONG,
                                    //     gravity: ToastGravity.BOTTOM,
                                    //     timeInSecForIosWeb: 1,
                                    //     backgroundColor: Color(0XFF00FF0),
                                    //     textColor: Colors.white,
                                    //     fontSize: 16.0);
                                    add = false;
                                  }
                                }
                                // Fluttertoast.showToast(msg: "Add to Fav");

                                if (add) {
                                  addToFav();
                                }
                              }
                              setState(() {
                                widget.food.isFav = !widget.food.isFav;
                              });
                            },
                            child: Container(
                                height: 29,
                                width: 30,
                                child: SvgPicture.string(
                                  bookmark,
                                  color: widget.food.isFav == true
                                      ? Colors.green
                                      : null,
                                )),
                          ),
                          Text("\$" + widget.food.price,
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              )),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          addtoCart();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xff23AA49),
                              borderRadius: BorderRadius.circular(10)),
                          height: 27,
                          width: 44,
                          child: Center(
                              child: FaIcon(
                            FontAwesomeIcons.plus,
                            color: Colors.white,
                            size: 20,
                          )),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ));
  }

  void addToFav() {
    final fav = context.read<Favprovider>();
    fav.addTofav(widget.food);
    Get.snackbar("Item", "Succesfully add to cart");
    // Fluttertoast.showToast(
    //   msg: "Added to Favourite",
    //   // toastLength: Toast.LENGTH_LONG,
    //   // gravity: ToastGravity.BOTTOM,
    //   // timeInSecForIosWeb: 1,
    //   // backgroundColor: Color(0XFF00FF0),
    //   // textColor: Colors.white,
    //   // fontSize: 16.0
    // );
  }

  void addtoCart() {
    final shop = context.read<Shop>();
    bool itemFound = false;
    for (int i = 0; i < shop.cart.length; i++) {
      if (widget.food.id == shop.cart[i].id) {
        shop.cart[i].qty += quantity;
        itemFound = true;
        break;
      }
    }

    if (!itemFound) {
      shop.addtoCart(widget.food, quantity);
      print("Added to cart");
    }
    Fluttertoast.showToast(
        msg: "Succesfully Added To Cart",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Color(0XFF00FF0),
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
