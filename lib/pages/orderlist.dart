import 'package:flutter/material.dart';
import 'package:gomart/model/product.dart';
import 'package:gomart/component/offer.dart';

class Myorderlist extends StatefulWidget {
  const Myorderlist({super.key});

  @override
  State<Myorderlist> createState() => _MyorderlistState();
}

class _MyorderlistState extends State<Myorderlist> {
  var Productlist = [
    ProductLocal(
        Pname: "Banana", Rate: "\$ 50", Imagepath: "assets/images/kela.png"),
    ProductLocal(
        Pname: "Apple",
        Rate: "\$ 70",
        Imagepath: "assets/images/applefruit.png"),
    ProductLocal(
        Pname: "Meat", Rate: "\$ 20", Imagepath: "assets/images/meat.png.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return Myoffer(
        child: Column(
      children: [
        Text(
          "Order",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 145),
              child: Text(
                "Order : 12254354",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Text(
                "Invoice",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff1E9DC2)),
              ),
            )
          ],
        ),
        ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              Card(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Card(child: Image.asset(Productlist[index].Imagepath)),
                        Text(
                          Productlist[index].Pname,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff575C55)),
                        ),
                        Text(
                          "Qty",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          Productlist[index].Rate,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            })
      ],
    ));
  }
}
