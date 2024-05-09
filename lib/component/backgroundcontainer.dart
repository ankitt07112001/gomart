import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Mybackground extends StatefulWidget {
  final child;

  const Mybackground({super.key, required this.child});

  @override
  State<Mybackground> createState() => _MybackgroundState();
}

class _MybackgroundState extends State<Mybackground> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: ScreenUtil().setHeight(-80),
              left: ScreenUtil().setHeight(-40),
              child: SizedBox(
                  height: 603.21.h,
                  width: 504.22.w,
                  child: Image.asset("assets/images/expdesign.png"))),
          Container(
            child: widget.child,
          )
        ],
      ),
    );
  }
}
