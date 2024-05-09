import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SlidableShimmer extends StatelessWidget {
  const SlidableShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        // direction: ShimmerDirection.ttb,
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade200,
        enabled: true,
        child: Container(
          color: Colors.white,
          height: 250,
        ));
  }
}
