import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Myseprated extends StatelessWidget {
  final String text;
  final String imagepath;
  final color;
  const Myseprated(
      {super.key,
      required this.text,
      required this.imagepath,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 70, right: 10, top: 20),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Color(0xff53B175)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 80),
              child: Text(
                text,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Color(0xff3E423F)),
              ),
            ),
            Image(
              image: AssetImage(imagepath),
              height: 400,
              width: 100,
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}
