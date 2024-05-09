import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductWidgetShimmer extends StatelessWidget {
  const ProductWidgetShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        // direction: ShimmerDirection.ttb,
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade200,
        enabled: true,
        child: GridView.builder(
            itemCount: 4,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.9,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      color: Colors.white,
                      height: 96,
                      width: 120,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 20,
                      width: 60,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 130,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black12),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 29,
                                width: 30,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xff23AA49),
                                borderRadius: BorderRadius.circular(10)),
                            height: 27,
                            width: 44,
                          )
                        ])
                  ]));
            }));
  }
}
