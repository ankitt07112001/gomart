import 'package:flutter/material.dart';

class Mydropdown extends StatefulWidget {
  const Mydropdown({super.key, this.child});
  final child;


  @override
  State<Mydropdown> createState() => _MydropdownState();
}

class _MydropdownState extends State<Mydropdown> {
  List dropDownListDate = [
    {"title": "1kg", "value": "1"},
    {"title": "2kg", "value": "2"},
    {"title": "3kg", "value": "3"},
    {"title": "4kg", "value": "4"},
  ];

  String defaultValue = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            InputDecorator(
              decoration: InputDecoration(
                border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(500))
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    isDense: true,
                    value: defaultValue,
                    isExpanded: true,
                    menuMaxHeight: 350,
                    items: [
                      const DropdownMenuItem(
                          child: Text("Weight "),
                      value: ""),

                        ...dropDownListDate.map<DropdownMenuItem<String>>((e) {
                        return DropdownMenuItem(
                            child: Text(e['title']), value: e['value']);
                      }).toList(),
                    ],
                    onChanged: (value){
                    print("Selected Value $value");
                    setState(() {
                       defaultValue =value!;
                    });
                }),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: widget.child)
          ],
        ),
      ),
    );

  }
}
