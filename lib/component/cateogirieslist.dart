import 'package:flutter/material.dart';

class Cateogirieswig extends StatelessWidget {
  final String imagepath;
  final String name;
  const Cateogirieswig(
      {super.key, required this.imagepath, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10.0),
          border: Border.symmetric(
              horizontal: BorderSide(color: Colors.grey, width: 0.2),
              vertical: BorderSide(color: Colors.grey, width: 0.2)),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.3),
              blurRadius: 5.0,
              spreadRadius: 1.0,
              offset: Offset(0.0, 0.0),
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Transform.scale(
                  scale: 0.6,
                  child: Image.network(
                    imagepath,
                  ))),
          Center(child: Text(name)),
        ],
      ),
    );
  }
}
