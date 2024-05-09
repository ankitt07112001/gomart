import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mybutton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final isLoading;
  const Mybutton(
      {super.key,
      required this.text,
      required this.onTap,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(20)),
        width: 342,
        height: 57,
        child: Center(
            child: isLoading == true
                ? CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  )
                : Text(
                    text,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Colors.white)),
                  )),
      ),
    );
  }
}
