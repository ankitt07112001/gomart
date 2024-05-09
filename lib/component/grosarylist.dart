import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mygrosarylist extends StatelessWidget {
  final String imagepath;
  final String text;
  final color;

  const Mygrosarylist(
      {super.key,
      required this.imagepath,
      required this.text,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 70, top: 20),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Color(0xffF8A44C)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(imagepath),
              height: 400.0,
              width: 100.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Text(
                text,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Color(0xff3E423F)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
