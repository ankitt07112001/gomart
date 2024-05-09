import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gomart/api_controller/OrderController.dart';
import 'package:gomart/api_controller/razorpaycontroller.dart';
import 'package:gomart/component/backgroundcontainer.dart';
import 'package:gomart/component/myrow.dart';
import 'package:google_fonts/google_fonts.dart';
import '../api_controller/addressCongtroller.dart';
import '../component/select _add.dart';

class Addresspg extends StatefulWidget {
  const Addresspg({Key? key}) : super(key: key);

  @override
  State<Addresspg> createState() => _AddresspgState();
}

class _AddresspgState extends State<Addresspg> {
  var addController = Get.put(AddressControlller());
  var razorController=Get.put(Mypayment());
  var cartController=Get.put(OrderController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List mylist = [
    {'id': 1, 'imgpath': 'assets/images/addhome.png', 'name': 'Home'},
    {'id': 2, 'imgpath': 'assets/images/addbulid.png', 'name': 'Office'},
    {'id': 3, 'imgpath': 'assets/images/addloc.png', 'name': 'Other'}
  ];

  int _selectedIndex = 0;

  void changeIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool? ischecked = false;

  String? validateCity(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter City';
    }
    if (value.contains(RegExp(r'\d'))) {
      return 'City should not contain\n numbers';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Mybackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 35.h,
              ),
              Myrow(),
              Container(
                height: 35.h,
                // width: 180.w,
                child: Text('Select Address',
                    style: GoogleFonts.beVietnamPro(
                      textStyle: TextStyle(
                        color: Color(0xFF3F2037),
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    )),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 65.h,
                    ),
                    Container(
                        height: 180.h,
                        width: 393.w,
                        margin: EdgeInsets.symmetric(horizontal: 8.w),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.7),
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Column(children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Select  Delivery Address',
                              // textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color(0xFF828282),
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Container(
                            height: 105,
                            child: ListView.builder(
                              itemCount: mylist.length,
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => Myselect_add(
                                imagepath: mylist[index]['imgpath'],
                                text: mylist[index]['name'],
                                mucolor: index == _selectedIndex
                                    ? Colors.blue
                                    : Color(0xFFD6D6D6),
                                onTap: () {
                                  changeIndex(index);
                                },
                              ),
                            ),
                          ),
                        ])),
                    SizedBox(
                      height: 30.h,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text(
                          'Address  Details',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color(0xFF575C55),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: TextFormField(
                        controller: addController.building,
                        decoration: InputDecoration(
                          labelText: 'Building/Society Name & Number',
                          labelStyle: GoogleFonts.beVietnamPro(
                              textStyle: TextStyle(
                                  fontSize: 16.sp,
                                  color: Color(0xff838383),
                                  fontWeight: FontWeight.w700)),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Building/Society Name & Number';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: TextFormField(
                        controller: addController.street,
                        decoration: InputDecoration(
                            labelText: 'Street Address, Landmark, etc.',
                            labelStyle: GoogleFonts.beVietnamPro(
                                textStyle: TextStyle(
                                    fontSize: 16.sp,
                                    color: Color(0xff838383),
                                    fontWeight: FontWeight.w700))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Address';
                          }
                          return null;
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              child: TextFormField(
                                controller: addController.zipcode,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(6),
                                ],
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Zip Code',
                                  labelStyle: GoogleFonts.beVietnamPro(
                                      textStyle: TextStyle(
                                          fontSize: 16.sp,
                                          color: Color(0xff838383),
                                          fontWeight: FontWeight.w700)),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Zip Code';
                                  }
                                  if (value.length != 6) {
                                    return 'Enter a valid Zip Code';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 20,
                              left: 20,
                            ),
                            child: Container(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'City',
                                  labelStyle: GoogleFonts.beVietnamPro(
                                      textStyle: TextStyle(
                                          fontSize: 16.sp,
                                          color: Color(0xff838383),
                                          fontWeight: FontWeight.w700)),
                                ),
                                validator: validateCity,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: ischecked,
                          activeColor: Colors.green,
                          onChanged: (newBool) {
                            setState(() {
                              ischecked = newBool;
                            });
                          },
                        ),
                        Row(
                          children: [
                            Text(
                              'Deliver at other Location',
                              style: TextStyle(
                                color: Color(0xFF828282),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate() &&
                            ischecked == true) {
                          addController.addressApi(_selectedIndex);
                          razorController.opencheckout(cartController.totalamount);
                        }
                      },
                      child: Container(
                        height: 57,
                        width: 342,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.green,
                        ),
                        child: Center(
                          child: Text(
                            "Next",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
