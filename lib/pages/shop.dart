import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gomart/component/backgroundcontainer.dart';
import 'package:gomart/component/icon.dart';
import 'package:gomart/pages/cart.dart';
import 'package:gomart/utils/svg_string.dart';

import '../component/offer.dart';

class Myshop extends StatefulWidget {
  const Myshop({super.key});

  @override
  State<Myshop> createState() => _MyshopState();
}

class _MyshopState extends State<Myshop> {
  @override
  Widget build(BuildContext context) {
    return Mybackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.string(arrowback)),
                  Myicon(onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Mycart(visible: true)));
                  })
                ],
              ),
            ),
            Container(
              child: Center(
                child: Text(
                  'Offers',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListView(
              shrinkWrap: true,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 17),
                  height: 120,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    // boxShadow: [BoxShadow(blurRadius: 1)],
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(
                      "New user? First Wash Free!!",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff575C55)),
                    ),
                    subtitle: Text(
                      'Your Order no. 12254354 is confirm\nNow. Pick up guy will reach at your\ndoorstep',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff838383)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 17),
                  height: 120,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    // boxShadow: [BoxShadow(blurRadius: 1)],
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(
                      "Upto 20% Discount on credit Card paymnet",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff575C55)),
                    ),
                    subtitle: Text(
                      'Your Order no. 12254354 is Ready to\nDispach Now. Kindly be at place to\ncollect the Delivery.',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff838383)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 17),
                  height: 120,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    // boxShadow: [BoxShadow(blurRadius: 1)],
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(
                      "Summer Offer: Pay for Wash & get Ironed free",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff575C55)),
                    ),
                    subtitle: Text(
                      "Your Order no. 12254354 is confirm\nNow. Pick up guy will reach at your\ndoorstep",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff838383)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 17),
                  height: 120,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    // boxShadow: [BoxShadow(blurRadius: 1)],
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(
                      "Get 1 Dry Clean Free on 2 Dry Clean order",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff575C55)),
                    ),
                    subtitle: Text(
                      'Your Order no. 12254354 is Ready to\nDispach Now. Kindly be at place to\ncollect the Delivery.',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff838383)),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
