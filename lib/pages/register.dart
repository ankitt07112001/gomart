import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gomart/component/RegExp.dart';
import '../api_controller/controller.dart';
import '../component/button1.dart';
import '../utils/svg_string.dart';
import 'login.dart';

class Myregister extends StatefulWidget {
  const Myregister({super.key});

  @override
  State<Myregister> createState() => _MyregisterState();
}

class _MyregisterState extends State<Myregister> {
  var myController = Get.put(Controller());
  bool _obscureText = true;
  String errorTextval = '';
  var _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      }, // Close keyboard when tapping outside

      child: Stack(children: [
        Container(
            height: double.infinity,
            child: Image.asset(
              'assets/images/register.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            )),
        Scaffold(
            backgroundColor: Colors.white.withOpacity(0.6),
            body: SafeArea(
              bottom: true,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.transparent,
                    // expandedHeight: 50,
                    floating: true,
                    leading: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Mylogin()));
                              },
                              child: SvgPicture.string(arrowback)),
                        ),
                      ],
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: Center(
                        child: Text('Register Now',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              fontFamily: 'Be Vietnam ',
                              color: Color(0xFF3F2037),
                              backgroundColor: Colors.transparent,
                            )),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(childCount: 1,
                        (BuildContext context, int index) {
                      return Column(
                        children: [
                          Container(
                            child: Form(
                              key: _formkey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 70,
                                  ),
                                  Container(
                                    width: 350,
                                    height: 75,
                                    margin:
                                        EdgeInsets.only(left: 25, right: 25),
                                    // decoration: BoxDecoration(
                                    //     color: Colors.white,
                                    //     borderRadius: BorderRadius.circular(10)),
                                    child: TextFormField(
                                        controller: myController.name,
                                        style: TextStyle(
                                            fontFamily: 'Be Vietnam '),
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator: (msg) {
                                          if (msg!.isEmpty) {
                                            return "Please Enter name";
                                          } else if (msg.length > 20) {
                                            return "Name should be not be greater than 20 character";
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            hintText: 'Enter Full Name',
                                            prefixIcon: Icon(
                                              Icons.person,
                                              color: Colors.green,
                                            ),
                                            filled: true,
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10)))),
                                  ),
                                  SizedBox(
                                    height: 17,
                                  ),
                                  Container(
                                    width: 350,
                                    height: 75,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 25),
                                    child: TextFormField(
                                      controller: myController.registeremail,
                                      style:
                                          TextStyle(fontFamily: 'Be Vietnam '),
                                      textInputAction: TextInputAction.next,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (msg) {
                                        const String email =
                                            "mailto:tony@starkindustries.com";
                                        // print(email.toString());
                                        final bool emailValid = RegExp(
                                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                            .hasMatch(msg!);
                                        if (emailValid == false) {
                                          return 'Please Enter Email';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'Email Address',
                                        prefixIcon: Icon(
                                          Icons.email_outlined,
                                          color: Colors.green,
                                        ),
                                        filled: true,
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 17,
                                  ),
                                  Container(
                                    width: 350,
                                    height: 75,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 25),
                                    child: PhoneNumberFormField(
                                        controller: myController.phno),
                                  ),
                                  SizedBox(
                                    height: 17,
                                  ),
                                  Container(
                                    width: 350,
                                    height: 75,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 25),
                                    child: TextFormField(
                                      controller: myController.Create_Password,
                                      style:
                                          TextStyle(fontFamily: 'Be Vietnam '),
                                      textInputAction: TextInputAction.next,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (msg) {
                                        if (msg == null || msg.isEmpty) {
                                          return "Please Create Password";
                                        } else if (msg.length < 8) {
                                          return "Password should be atleast 8 character";
                                        } else if (msg.length > 15) {
                                          return "Password should not be greater than 15 characters";
                                        } else if (!RegExp(
                                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                            .hasMatch(msg)) {
                                          return "Password is not strong  eg : Vignesh@123";
                                        } else
                                          return null;
                                      },
                                      obscureText: _obscureText ? true : false,
                                      decoration: InputDecoration(
                                        hintText: 'Create Password',
                                        prefixIcon: Icon(
                                          Icons.lock_outline,
                                          color: Colors.green,
                                        ),
                                        filled: true,
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 17,
                                  ),
                                  Container(
                                    width: 350,
                                    height: 75,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 25),
                                    child: TextFormField(
                                      controller: myController.Confirm_Password,
                                      style:
                                          TextStyle(fontFamily: 'Be Vietnam '),
                                      textInputAction: TextInputAction.next,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (msg) {
                                        if (msg == null || msg.isEmpty) {
                                          return "Please Enter Confirm Password";
                                        } else if (myController
                                                .Create_Password.text !=
                                            myController
                                                .Confirm_Password.text) {
                                          return "Password Do Not Match";
                                        }
                                        return null;
                                      },
                                      obscureText: _obscureText ? true : false,
                                      decoration: InputDecoration(
                                        hintText: 'Confirm Password',
                                        prefixIcon: Icon(
                                          Icons.lock_outline,
                                          color: Colors.green,
                                        ),
                                        filled: true,
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Obx(
                                    () => Center(
                                      child: Common_button(
                                          isLoading: myController
                                              .registerLoading.value,
                                          name: 'Register Now',
                                          width: 342.0,
                                          height: 60.0,
                                          onTap: () {
                                            if (_formkey.currentState!
                                                .validate()) {
                                              myController.registerapi();
                                              print("loading" +
                                                  myController
                                                      .registerLoading.value
                                                      .toString());
                                            }
                                          }),
                                    ),
                                  ),
                                  Container(
                                    child: Center(
                                      child: Text(
                                        'Or',
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: Color(0xff000000),
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 200,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        TextButton(
                                          onPressed: () {},
                                          child: Image.asset(
                                              'assets/images/goolge.png',
                                              width:
                                                  ScreenUtil().setWidth(30.57),
                                              height:
                                                  ScreenUtil().setHeight(35)),
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          child: Image.asset(
                                            'assets/images/fb2.png',
                                            width: 30,
                                            height: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      child: RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                          color: Color(0xff55836F),
                                          fontSize: 16,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'I have an account?',
                                              style: TextStyle(
                                                  color: Color(0xff55836F),
                                                  fontFamily: 'Be Vietnam ')),
                                          TextSpan(
                                              text: ' Sign In',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                fontFamily: 'Be Vietnam ',
                                                color: Color(0xff3F2037),
                                              ),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Mylogin()));
                                                }),
                                        ]),
                                  )),
                                  SizedBox(
                                    height: 30,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ))
      ]),
    );
  }
}
