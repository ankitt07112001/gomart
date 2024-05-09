import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Mybackground2 extends StatelessWidget {
  const Mybackground2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 1.5,
      child: Container(
        height: 600.h,
        // width: MediaQuery.of(context).size.width * .6,
        width: 600.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            // begin: Alignment.topLeft,
            // end: Alignment.bottomRight,
            colors: <Color>[
              Color(0XFF2CCC33),
              Colors.white,
            ],
          ),
        ),
      ),
    );
  }
}
