import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gomart/component/backgroundcontainer.dart';
import 'package:gomart/component/icon.dart';
import 'package:gomart/component/seprated.dart';
import 'package:gomart/pages/cart.dart';
import 'package:gomart/utils/svg_string.dart';
import 'package:google_fonts/google_fonts.dart';

import '../component/grosarylist.dart';
import 'grocerydetail.dart';

class Mygrosery extends StatefulWidget {
  bool get isOdd {
    // TODO: implement isOdd
    throw UnimplementedError();
  }

  bool get isEven {
    // TODO: implement isEven
    throw UnimplementedError();
  }

  const Mygrosery({super.key});

  @override
  State<Mygrosery> createState() => _MygroseryState();
}

class _MygroseryState extends State<Mygrosery> {
  List GroceryList = [
    {
      "id": 1,
      "imagepath": "assets/listimages/grain1.png",
      "name": "Pulses",
      "color": Color(0xffF8A44C)
    },
    {
      "id": 2,
      "imagepath": "assets/listimages/grain2.png",
      "name": "Rice",
      "color": Color(0xff53B175)
    },
    {
      "id": 3,
      "imagepath": "assets/listimages/grain1.png",
      "name": "Bread",
      "color": Color(0xffF8A44C)
    },
    {
      "id": 4,
      "imagepath": "assets/listimages/grain2.png",
      "name": "Coffee",
      "color": Color(0xff53B175)
    },
    {
      "id": 5,
      "imagepath": "assets/listimages/grain1.png",
      "name": "Grains",
      "color": Color(0xffF8A44C)
    },
    {
      "id": 6,
      "imagepath": "assets/listimages/grain2.png",
      "name": "Corn",
      "color": Color(0xff53B175)
    },
    {
      "id": 7,
      "imagepath": "assets/listimages/grain1.png",
      "name": "Seeds",
      "color": Color(0xffF8A44C)
    },
    {
      "id": 8,
      "imagepath": "assets/listimages/grain2.png",
      "name": "Wheat",
      "color": Color(0xff53B175)
    },
  ];

  @override
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
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.string(arrowback)),
                Text("Groceries",
                    style: GoogleFonts.beVietnamPro(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 24))),
                Myicon(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Mycart(visible: true)));
                  },
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: GroceryList.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return index % 2 == 0
                      ? InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Mygrocerydetail(
                                          text: GroceryList[index]["name"],
                                        )));
                          },
                          child: Mygrosarylist(
                            imagepath: GroceryList[index]["imagepath"],
                            text: GroceryList[index]["name"],
                            color: GroceryList[index]["color"],
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Mygrocerydetail(
                                          text: GroceryList[index]["name"],
                                        )));
                          },
                          child: Myseprated(
                            text: GroceryList[index]["name"],
                            imagepath: GroceryList[index]["imagepath"],
                            color: GroceryList[index]["color"],
                          ));
                }),
          )
        ],
      ),
    ));
  }
}
