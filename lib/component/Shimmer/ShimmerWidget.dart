import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidgetCart extends StatelessWidget {
  const ShimmerWidgetCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        // direction: ShimmerDirection.ttb,
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade200,
        enabled: true,
        child: ListView.separated(
          // physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                  color: Color(0xffE2E2E2).withOpacity(.3),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300)),
              width: 400,
              height: 110,
              child: Row(
                children: [
                  Container(
                    color: Colors.white,
                    height: 84,
                    width: 85,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 65,
                        height: 23,
                        color: Colors.white,
                      ),
                      Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Colors.black.withOpacity(.2))),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.grey.shade400,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.green.shade400,
                            )
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   height: 30,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            color: Colors.white,
                            height: 29,
                            width: 100,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 20,
            );
          },
        ));
  }
}
