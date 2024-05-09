import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Myselect_add extends StatefulWidget {
  final void Function()? onTap;
  final String imagepath;
  final String text;
  final mucolor;
  const Myselect_add(
      {super.key,
      required this.imagepath,
      required this.text,
      this.mucolor = Colors.white,
      required this.onTap});

  @override
  State<Myselect_add> createState() => _Myselect_addState();
}

class _Myselect_addState extends State<Myselect_add> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          height: 89.h,
          width: 115.w,
          decoration: BoxDecoration(
            border: Border.all(width: 0.9, color: widget.mucolor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(widget.imagepath),
              Text(
                widget.text,
                style: TextStyle(
                  color: Color(0xFF405B7E),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
