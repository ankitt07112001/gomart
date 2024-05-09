import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dropdown_year extends StatefulWidget {
  const Dropdown_year({super.key});
  @override
  State<Dropdown_year> createState() => _Dropdown_yearState();
}
class _Dropdown_yearState extends State<Dropdown_year> {

  List<String> yearlist = [
    "2011",
    "2012",
    "2013",
    "2014",
    "2015",
    "2016",
    "2017",
    "2018",
    "2019",
    "2020",
    "2021",
    "2024",
    "2025",
    "2026",
  ];
  String? yearvalue;

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Container(
         // width:MediaQuery.of(context).size.width/2,
          decoration: BoxDecoration(
          ),
          child: DropdownButton<String>(
              hint: Text('Year              ',style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Color(0xFF838383))),
              iconEnabledColor: Color(0xFF52A9D8),
              iconSize: 30,
              value: yearvalue,
              items: yearlist.map((String value){
                return DropdownMenuItem<String>(
                    value: value, child: Text(value));
              }).toList(), onChanged: (newValue){
            setState(() {
              yearvalue = newValue!;
            });
          }),
        ),
    );
  }
}

