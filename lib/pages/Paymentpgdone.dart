import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'Listview.dart';
import 'Paymentpg.dart';

import 'invoicepg.dart';

import 'mainscreen.dart';
import 'home.dart';
import 'orderinvoicepg.dart';

class Paymentpage_Done extends StatefulWidget {
  // final price;
  const Paymentpage_Done({super.key});

  @override
  State<Paymentpage_Done> createState() => _Paymentpage_DoneState();
}

class _Paymentpage_DoneState extends State<Paymentpage_Done> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -100,
            left: -80,
            child: Image(
                height: 603.21,
                width: 504.22,
                image: AssetImage('assets/images/addbg.png')),
          ),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 35, left: 120),
                    child: Container(
                        child: Text('Payment',
                            style: GoogleFonts.beVietnamPro(
                              textStyle: TextStyle(
                                color: Color(0xFF3F2037),
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                              ),
                            ))),
                  )
                ],
              ),
            ],
          ),
          SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(top: 125, left: 2),
                child: Center(
                  child: Container(
                      height: 340,
                      child:
                          Lottie.asset('assets/images/paymentdonejson.json')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 740,
                  left: 35,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Mymainscreen()));

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Myhome()));

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Mymainscreen()));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Myhome()));
                  },
                  child: Container(
                    height: 57,
                    width: 340,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                        child: Text(
                          'Your Order has been Successfully',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF181725)),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
