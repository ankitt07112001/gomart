import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mycart_component extends StatelessWidget {
  final String imagepath;
  final String text1;
  final String text2;

  const Mycart_component(
      {super.key,
      required,
      required this.imagepath,
      required this.text1,
      required this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(16)),
      width: 163,
      height: 67,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 16.0, right: 8, top: 12, bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Image(
                image: AssetImage(imagepath),
                height: 31,
                width: 30,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text1,
                    style: GoogleFonts.dmSans(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.green,
                      ),
                    )),
                SizedBox(
                  height: 3,
                ),
                Text(
                  text2,
                  style: GoogleFonts.dmSans(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xff979899),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
