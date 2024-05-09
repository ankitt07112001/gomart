import 'package:flutter/material.dart';

class Food_tile extends StatelessWidget {
  final String imagepath;
  final String text;
  final color;
  const Food_tile(
      {super.key,
      required this.color,
      required this.imagepath,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 248.187,
      height: 105,
      // padding: EdgeInsets.only(left: 16, right: 16, top: 15, bottom: 15),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Image.asset(imagepath),
          SizedBox(
            width: 15,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xff3E423F)),
          ),
        ],
      ),
    );
  }
}
