import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gomart/api_controller/editProfileController.dart';
import 'package:gomart/api_controller/url.dart';
import 'package:gomart/component/icon.dart';
import 'package:gomart/pages/cart.dart';
import 'package:gomart/pages/editprofilepg.dart';
import 'package:gomart/pages/shop.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

import '../component/backgroundcontainer.dart';
import '../utils/svgstring.dart';
import 'Addresspg.dart';
import 'Listview.dart';
import 'login.dart';

class profile extends StatefulWidget {
  final visible;

  const profile({super.key, required this.visible});

  @override
  State<profile> createState() => _profileState();
}

bool status = false;
bool switchValue = false;

class _profileState extends State<profile> {
  var editController = Get.put(EditProfileController());
  int selectedValue = 0;
  bool isbool = false;
  var box = GetStorage();
  File? imagefile;
  @override
  void initState() {
    editController.getEditProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Mybackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(46.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Visibility(
                                visible: widget.visible,
                                child: SvgPicture.string(backicon)),
                          ),
                          Center(
                              child: Text(
                            "Profile",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF3F2037),
                                fontFamily: "Dmsans",
                                fontSize: 24),
                          )),
                          Myicon(onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Mycart(
                                          visible: true,
                                        )));
                          })
                        ],
                      ),
                    ),
                  ),
                ),
                body: SingleChildScrollView(
                    child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.symmetric(
                                  horizontal: BorderSide(
                                      color: Colors.grey, width: 0.2),
                                  vertical: BorderSide(
                                      color: Colors.grey, width: 0.2)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.3),
                                  // color: Color(0xffDDDDDD),
                                  blurRadius: 5.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(0.0, 0.0),
                                )
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    height: 100.h,
                                    width: 100.w,
                                    decoration:
                                        BoxDecoration(shape: BoxShape.circle),
                                    child: GestureDetector(
                                        onTap: () {},
                                        child:
                                            //  box.read("image") == null
                                            //     ?
                                            // Image.asset(
                                            //     "assets/images/profile.png",
                                            //     height: 100,
                                            //     width: 100,
                                            //   )
                                            // :
                                            ClipOval(
                                          child: Image.network(
                                            imageurl +
                                                editController
                                                    .UserProfileList[0].profile,
                                            height: 100,
                                            width: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        ))),
                                SizedBox(
                                  width: 28.w,
                                ),
                                Text(
                                  editController.UserProfileList[0].name,
                                  // box.read("user_name").toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF575C55),
                                      fontFamily: "Dmsans",
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            height: 51,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.symmetric(
                                  horizontal: BorderSide(
                                      color: Colors.grey, width: 0.2),
                                  vertical: BorderSide(
                                      color: Colors.grey, width: 0.2)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.3),
                                  // color: Color(0xffDDDDDD),
                                  blurRadius: 5.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(0.0, 0.0),
                                )
                              ],
                            ),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(width: 60, child: Icon(Icons.mode)),
                                Container(
                                  child: TextButton(
                                    onPressed: () {
                                      Get.to(EditProfilePage());
                                    },
                                    child: Text(
                                      "Edit Profile",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF3F2037),
                                          fontFamily: "Dmsans",
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            height: 51,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.symmetric(
                                  horizontal: BorderSide(
                                      color: Colors.grey, width: 0.2),
                                  vertical: BorderSide(
                                      color: Colors.grey, width: 0.2)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.3),
                                  // color: Color(0xffDDDDDD),
                                  blurRadius: 5.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(0.0, 0.0),
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 40,
                                      child:
                                          SvgPicture.string(pushnotification)),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(
                                              "Push notification",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF3F2037),
                                                  fontFamily: "Dmsans",
                                                  fontSize: 20),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: CupertinoSwitch(
                                            value: switchValue,
                                            thumbColor: const Color.fromRGBO(
                                                30, 157, 194, 0.59),
                                            activeColor: Colors.white,
                                            trackColor: Colors.white,
                                            // Current state of the switch
                                            onChanged: (value) {
                                              setState(() {
                                                switchValue =
                                                    value; // Update the switch state
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 51,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.symmetric(
                                  horizontal: BorderSide(
                                      color: Colors.grey, width: 0.2),
                                  vertical: BorderSide(
                                      color: Colors.grey, width: 0.2)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.3),
                                  // color: Color(0xffDDDDDD),
                                  blurRadius: 5.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(0.0, 0.0),
                                )
                              ],
                            ),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    width: 60, child: SvgPicture.string(order)),
                                Container(
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Mylistview()));
                                    },
                                    child: Text(
                                      "Order",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF3F2037),
                                          fontFamily: "Dmsans",
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 51,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.symmetric(
                                  horizontal: BorderSide(
                                      color: Colors.grey, width: 0.2),
                                  vertical: BorderSide(
                                      color: Colors.grey, width: 0.2)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.3),
                                  // color: Color(0xffDDDDDD),
                                  blurRadius: 5.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(0.0, 0.0),
                                )
                              ],
                            ),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    width: 60,
                                    child: SvgPicture.string(myaddress)),
                                Container(
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Addresspg()));
                                    },
                                    child: Text(
                                      "My Address",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF3F2037),
                                          fontFamily: "Dmsans",
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 51,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.symmetric(
                                  horizontal: BorderSide(
                                      color: Colors.grey, width: 0.2),
                                  vertical: BorderSide(
                                      color: Colors.grey, width: 0.2)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.3),
                                  // color: Color(0xffDDDDDD),
                                  blurRadius: 5.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(0.0, 0.0),
                                )
                              ],
                            ),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    width: 60,
                                    child: SvgPicture.string(aboutus)),
                                Container(
                                  child: Text(
                                    "About us",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF3F2037),
                                        fontFamily: "Dmsans",
                                        fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 51,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.symmetric(
                                  horizontal: BorderSide(
                                      color: Colors.grey, width: 0.2),
                                  vertical: BorderSide(
                                      color: Colors.grey, width: 0.2)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.3),
                                  // color: Color(0xffDDDDDD),
                                  blurRadius: 5.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(0.0, 0.0),
                                )
                              ],
                            ),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    width: 60,
                                    child: SvgPicture.string(contactus)),
                                Container(
                                  child: Text(
                                    "Contact us",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF3F2037),
                                        fontFamily: "Dmsans",
                                        fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 51,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.symmetric(
                                  horizontal: BorderSide(
                                      color: Colors.grey, width: 0.2),
                                  vertical: BorderSide(
                                      color: Colors.grey, width: 0.2)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.3),
                                  // color: Color(0xffDDDDDD),
                                  blurRadius: 5.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(0.0, 0.0),
                                )
                              ],
                            ),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    width: 60, child: SvgPicture.string(offer)),
                                Container(
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Myshop()));
                                    },
                                    child: Text(
                                      "Offer",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF3F2037),
                                          fontFamily: "Dmsans",
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 51,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.symmetric(
                                  horizontal: BorderSide(
                                      color: Colors.grey, width: 0.2),
                                  vertical: BorderSide(
                                      color: Colors.grey, width: 0.2)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.3),
                                  // color: Color(0xffDDDDDD),
                                  blurRadius: 5.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(0.0, 0.0),
                                )
                              ],
                            ),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    width: 60,
                                    child: SvgPicture.string(logout)),
                                Container(
                                  child: TextButton(
                                    child: Text(
                                      "Log Out",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF3F2037),
                                          fontFamily: "Dmsans",
                                          fontSize: 20),
                                    ),
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (context) => AlertDialog(
                                                backgroundColor: Colors.white,
                                                content: Text(
                                                    "Are you sure want to logout ?",
                                                    style: GoogleFonts
                                                        .beVietnamPro(
                                                            textStyle: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Colors
                                                                    .black))),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      box.remove("token");
                                                      Navigator.pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      Mylogin()));
                                                    },
                                                    child: Text(
                                                      "Yes",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("No",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Colors
                                                                  .black)))
                                                ],
                                              ));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 15.h,
                          )
                        ],
                      ),
                    ),
                  ],
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
