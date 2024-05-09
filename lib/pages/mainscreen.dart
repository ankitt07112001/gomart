import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gomart/api_controller/controller.dart';
import 'package:gomart/pages/profile_desing.dart';
import 'package:gomart/utils/svg_string.dart';
import 'cart.dart';
import 'explore.dart';
import 'favourite.dart';
import 'home.dart';

class Mymainscreen extends StatefulWidget {
  const Mymainscreen({super.key});

  @override
  State<Mymainscreen> createState() => _MymainscreenState();
}

class _MymainscreenState extends State<Mymainscreen> {
  var myController = Get.put(Controller());
  int _currentindex = 0;
  bool colorselected = false;

  void color() {
    setState(() {
      colorselected = !colorselected;
    });
  }

  int _selected = 0;
  void ChangeSelected(int index) {
    setState(() {
      _selected = index;
    });
  }

  // int currentIndex = 0;

  changeIndex(index) {
    setState(() {
      _currentindex = index;
    });
  }

  List pages = [
    Myhome(),
    Myexplore(
      visible: false,
      // title: '',
    ),
    Mycart(
      visible: false,
    ),
    Favourite(
      visible: false,
    ),
    profile(
      visible: false,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        type: BottomNavigationBarType.fixed,
        // backgroundColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.string(
              Shopsvg,
              color: _currentindex == 0 ? Colors.green : Color(0xff3F2037),
            ),
            label: "Shop",
            // backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.string(
              Explore,
              color: _currentindex == 1 ? Colors.green : null,
            ),
            label: "Explore",
            // backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.string(
              Cartt,
              color: _currentindex == 2 ? Colors.green : null,
            ),
            label: "Cart",
            // backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.string(
              Favouritee,
              color: _currentindex == 3 ? Colors.green : null,
            ),
            label: "Favourite",
            // backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.string(
              Account,
              color: _currentindex == 4 ? Colors.green : null,
            ),
            label: "Account",
            // backgroundColor: Colors.brown,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
      ),
      body: pages[_currentindex],
    );
  }
}
