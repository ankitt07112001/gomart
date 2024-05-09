import 'package:flutter/material.dart';

class DropDown_month extends StatefulWidget {
  const DropDown_month({super.key});

  @override
  State<DropDown_month> createState() => _DropDown_monthState();
}

class _DropDown_monthState extends State<DropDown_month> {
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
  String? monthvalue;
  String? yearvalue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(),
                          child: DropdownButton<String>(
                              hint: Text('Month'),
                              value: monthvalue,
                              items: monthlist.map((String value) {
                                return DropdownMenuItem<String>(
                                    value: value, child: Text(value));
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  monthvalue = newValue!;
                                });
                              }),
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                              ),
                              child: DropdownButton<String>(
                                  hint: Text('Year'),
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
                          ],
                        )
                      ],
                    ),

                  ],
                ),


          ),
    );
  }
}
