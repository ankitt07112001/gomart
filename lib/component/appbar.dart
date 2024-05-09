import 'package:flutter/material.dart';

class Myappbar extends StatelessWidget {
  final String imagepath;
  final String text;

  const Myappbar({
    super.key,
    required this.imagepath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            child: Icon(Icons.arrow_back_ios),
          ),
          Text(
            text,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                child: Icon(Icons.search),
              ),
              Image(
                image: AssetImage(
                  imagepath,
                ),
                height: 22.5,
                width: 33.75,
              )
            ],
          )
        ],
      ),
    );
  }
}
