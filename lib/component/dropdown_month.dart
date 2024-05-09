import 'package:flutter/material.dart';

class Dropdown_month extends StatefulWidget {
  const Dropdown_month(
      {super.key, required String? Function(dynamic value) validator});

  @override
  State<Dropdown_month> createState() => _Dropdown_monthState();
}

class _Dropdown_monthState extends State<Dropdown_month> {
  List<String> monthlist = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
  ];
  String? monthvalue;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(),
        child: DropdownButton<String>(
            value: monthvalue,
            iconEnabledColor: Color(0xFF52A9D8),
            iconSize: 30,
            hint: Text('Month           ',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Color(0xFF838383))),
            items: monthlist.map((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                monthvalue = newValue!;
              });
            }),
      ),
    );
  }
}
