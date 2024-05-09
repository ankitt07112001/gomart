import 'package:flutter/material.dart';

class Common_button extends StatefulWidget {
  const Common_button({
    super.key,
    required this.name,
    required this.onTap,
    this.isLoading,
    this.width = 300.0,
    this.height = 60.0,
    this.fontSize = 24.0,
  });
  final name;
  final isLoading;
  final Function onTap;
  final width;
  final height;
  final fontSize;
  @override
  State<Common_button> createState() => _Common_buttonState();
}

class _Common_buttonState extends State<Common_button> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              //BoxShadow(color: Colors.green,
              //spreadRadius: 1, blurRadius: 1,
            ]),
        child: Center(
            child: widget.isLoading == true
                ? CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: widget.fontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Be Vietnam',
                    ),
                  )),
      ),
    );
  }
}
