import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gomart/api_controller/url.dart';
import 'package:google_fonts/google_fonts.dart';

class Myfavwidget extends StatefulWidget {
  final String imagepath;
  final String name;
  final Function()? addToCart;
  final String price;
  // final void Function()? addtocart;

  const Myfavwidget({
    super.key,
    required this.imagepath,
    required this.name,
    required this.price,
    required this.addToCart,
    // this.addtocart
  });

  @override
  State<Myfavwidget> createState() => _MyfavwidgetState();
}

class _MyfavwidgetState extends State<Myfavwidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 130,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            imageurl + widget.imagepath,
            height: 74,
            width: 70,
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Column(
              children: [
                SizedBox(
                  height: 17,
                ),
                Text(
                  widget.name,
                  style: GoogleFonts.beVietnamPro(
                      textStyle: TextStyle(
                          color: Color(0xff181725),
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                ),
                Text(
                  "550ml,price",
                  style: GoogleFonts.beVietnamPro(
                      textStyle: TextStyle(
                          color: Color(0xff7C7C7C),
                          fontWeight: FontWeight.w400,
                          fontSize: 14)),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            "\$" + widget.price,
            style: GoogleFonts.beVietnamPro(
                textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff181725))),
          ),
          // const SizedBox(
          //   width: 15,
          // ),
          Transform.translate(
            offset: Offset(0, -15),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: widget.addToCart,
                // widget.addtocart,
                child: Text(
                  "Add Cart",
                  style: GoogleFonts.beVietnamPro(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 14)),
                )),
          )
        ],
      ),
    );
  }
}
