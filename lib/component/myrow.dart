import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gomart/component/icon.dart';
import 'package:gomart/pages/cart.dart';
import 'package:gomart/utils/svg_string.dart';

class Myrow extends StatelessWidget {
  const Myrow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.string(arrowback)),
          Myicon(onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => Mycart(visible: true)));
          })
        ],
      ),
    );
  }
}
