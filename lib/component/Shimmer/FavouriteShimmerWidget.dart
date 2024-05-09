import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class FavouriteShimmer extends StatelessWidget {
  const FavouriteShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 130,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 74,
            color: Colors.white,
            width: 70,
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Column(
              children: [
                SizedBox(
                  height: 17,
                ),
                Container(
                  color: Colors.white,
                  height: 10,
                ),
                Container(
                  color: Colors.white,
                )
              ],
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Container(
            color: Colors.white,
            height: 5,
            width: 5,
          ),
          // const SizedBox(
          //   width: 15,
          // ),
          Container(
            color: Colors.white,
            height: 15,
            width: 15,
          )
        ],
      ),
    );
  }
}
