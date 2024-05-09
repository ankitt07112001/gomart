import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gomart/component/backgroundcontainer.dart';
import 'package:gomart/component/icon.dart';
import 'package:gomart/pages/cart.dart';
import 'package:gomart/utils/svg_string.dart';
import 'package:google_fonts/google_fonts.dart';

import '../component/fooddetails.dart';
import '../model/foodinfo.dart';
import 'foodalldetails.dart';

class Mygrocerydetail extends StatefulWidget {
  final String text;
  const Mygrocerydetail({super.key, required this.text});

  @override
  State<Mygrocerydetail> createState() => _MygrocerydetailState();
}

class _MygrocerydetailState extends State<Mygrocerydetail> {
  List Detaillist = [
    Food(
        price: "232.15",
        imagepath: "assets/catimages/bananas.png",
        name: "Banana",
        id: 7),
    Food(
        price: "232.15",
        imagepath: "assets/catimages/cherries.png",
        name: "Cherries",
        id: 8),
    Food(
        price: "232.15",
        imagepath: "assets/catimages/grapes.png",
        name: "Grapes",
        id: 9),
    Food(
        price: "232.15",
        imagepath: "assets/catimages/mango.png",
        name: "Mango",
        id: 10),
    Food(
        price: "232.15",
        imagepath: "assets/catimages/orange.png",
        name: "Orange",
        id: 11),
    Food(
        price: "232.15",
        imagepath: "assets/catimages/pineapple.png",
        name: "Pineapple",
        id: 12),
    Food(
        price: "232.15",
        imagepath: "assets/catimages/strawberry.png",
        name: "Strawberry",
        id: 13),
    Food(
        price: "232.15",
        imagepath: "assets/catimages/vege2.png",
        name: "Carrot",
        id: 14),
    Food(
        price: "232.15",
        imagepath: "assets/catimages/vege3.png",
        name: "Tomato",
        id: 15),
    Food(
        price: "232.15",
        imagepath: "assets/catimages/vege4.png",
        name: "Pumpkin",
        id: 16),
    Food(
        price: "232.15",
        imagepath: "assets/catimages/vege5.png",
        name: "Peas",
        id: 17),
    Food(
        price: "232.15",
        imagepath: "assets/catimages/vege6.png",
        name: "Potato",
        id: 18),
    Food(
        price: "232.15",
        imagepath: "assets/catimages/vege7.png",
        name: "Onion",
        id: 19),
    Food(
        price: "232.15",
        imagepath: "assets/catimages/vege8.png",
        name: "Capsicum",
        id: 20),
  ];
  @override
  Widget build(BuildContext context) {
    return Mybackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 58.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.string(arrowback)),
                  Text(widget.text,
                      style: GoogleFonts.beVietnamPro(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 24))),
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
              child: GridView.builder(
                itemCount: Detaillist.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Fooddetails(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Myalldetails(
                                      imagepath: Detaillist[index],
                                      name: Detaillist[index],
                                      description: Detaillist[index],
                                      price: Detaillist[index],
                                    )));
                      },
                      food: Detaillist[index]);
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .9,
                  mainAxisSpacing: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
