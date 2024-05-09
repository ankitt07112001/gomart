import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Myoffer extends StatefulWidget {
  final child;
  const Myoffer({super.key, required this.child});

  @override
  State<Myoffer> createState() => _MyofferState();
}

class _MyofferState extends State<Myoffer> {
  var arrowback =
      '''<svg width="44" height="44" viewBox="0 0 44 44" fill="none" xmlns="http://www.w3.org/2000/svg">
<circle cx="22" cy="22" r="22" fill="white" fill-opacity="0.9"/>
<path d="M24.75 15.5833C24.6294 15.5826 24.5098 15.6057 24.3981 15.6513C24.2864 15.697 24.1849 15.7642 24.0992 15.8491L18.5992 21.3491C18.4285 21.5209 18.3326 21.7532 18.3326 21.9954C18.3326 22.2376 18.4285 22.4699 18.5992 22.6416L24.0992 28.1416C24.2746 28.2918 24.5001 28.3703 24.7308 28.3614C24.9615 28.3525 25.1804 28.2568 25.3436 28.0936C25.5069 27.9303 25.6025 27.7115 25.6114 27.4808C25.6203 27.2501 25.5419 27.0245 25.3917 26.8491L20.5425 22L25.3917 17.1508C25.5204 17.0231 25.6084 16.8602 25.6445 16.6825C25.6806 16.5049 25.6632 16.3205 25.5945 16.1527C25.5258 15.9849 25.409 15.8413 25.2586 15.7399C25.1083 15.6386 24.9313 15.5841 24.75 15.5833Z" fill="#06161C"/>
</svg>

''';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -100,
            left: -80,
            child: Image(
                height: 603.21,
                width: 504.22,
                image: AssetImage('assets/images/addbg.png')),
          ),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80, left: 15),
                    child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.string(arrowback)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 200, top: 80),
                    child: TextButton(
                        onPressed: () {},
                        child: Image.asset("assets/images/cart.png")),
                  ),
                ],
              ),
            ],
          ),
          Expanded(flex: 1, child: widget.child)
        ],
      ),
    );
  }
}
