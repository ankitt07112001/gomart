import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gomart/api_controller/controller.dart';
import 'package:gomart/pages/register.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import '../component/button1.dart';

class Mylogin extends StatefulWidget {
  const Mylogin({super.key});

  @override
  State<Mylogin> createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {
  var myController = Get.put(Controller());
  bool _obscureText = true;
  String errorTextval = '';
  final _formkey = GlobalKey<FormState>();
  final _formkey1 = GlobalKey<FormState>();
  final _formkey2 = GlobalKey<FormState>();

  // TextEditingController _Create_Password = TextEditingController();
  // TextEditingController _Confirm_Password = TextEditingController();

  var emailrequired = true;
  var passwordrequired = false;
  var clickemail = false;
  var clickpassword = false;

  // var formkey=GlobalKey<FormState>();
  // TextEditingController email = TextEditingController();
  // TextEditingController password = TextEditingController();
  bool passwordVisible = false;
  bool emailError = false;
  bool passwordError = false;
  bool invalidEmailError = false;
  // final _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    passwordVisible = false;
    // startStreaming();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          final shouldpop = await showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => AlertDialog(
                    backgroundColor: Colors.white,
                    content: Text(
                      "Are you sure want to exit?",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "No",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            exit(0);
                          },
                          child: Text("Yes",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black)))
                    ],
                  ));
          return shouldpop;
        },
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Scaffold(
            body: SafeArea(
              bottom: true,
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset('assets/images/login.png'),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'SIgn In Now',
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(24),
                            fontWeight: FontWeight.w700,
                            fontFamily: 'FontMain',
                            color: Color(0xff3F2037)),
                      ),
                    ),
                    Form(
                      key: _formkey,
                      child: (Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenUtil().setWidth(35)),
                            child: Card(
                              elevation: 1,
                              child: TextFormField(
                                controller: myController.email,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (msg) {
                                  return null;
                                },
                                onChanged: (e) {
                                  checkValidation(e);

                                  setState(() {
                                    emailrequired = false;
                                  });
                                },
                                decoration: InputDecoration(
                                  labelText: 'Email ',
                                  labelStyle: TextStyle(color: Colors.black),
                                  hintText: "Enter your email",
                                  hintStyle: TextStyle(
                                      color: Color(0xff979899),
                                      fontSize: ScreenUtil().setSp(16)),
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: Colors.green,
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                ),
                              ),
                              // onChange: (value) =>{email},
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          !emailError
                              ? SizedBox()
                              : Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: ScreenUtil().setWidth(50)),
                                  child: Text(
                                    emailError
                                        ? invalidEmailError
                                            ? 'Please enter a valid email'
                                            : 'Please enter email'
                                        : '',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                          SizedBox(
                            height: ScreenUtil().setHeight(20),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenUtil().setWidth(35)),
                            child: Card(
                              elevation: 1,
                              child: TextFormField(
                                controller: myController.password,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (msg) {
                                  return null;
                                },
                                onChanged: (e) {
                                  validationCheck(e);
                                  // setState(() {
                                  //   passwordrequired = false;
                                  // });
                                },
                                // obscureText: true,
                                obscureText: !passwordVisible,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: TextStyle(color: Colors.black),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Theme.of(context).primaryColorDark,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        passwordVisible = !passwordVisible;
                                      });
                                    },
                                  ),
                                  hintText: "Please enter password",
                                  hintStyle: TextStyle(
                                      color: Color(0xff979899),
                                      fontSize: 16.sp),
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(
                                    Icons.lock_outline,
                                    color: Colors.green,
                                  ),
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(2),
                          ),
                          !passwordrequired
                              ? SizedBox()
                              : Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: ScreenUtil().setWidth(50)),
                                  child: Text(
                                    'Please Enter Password',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Get.dialog(
                                      barrierDismissible: false,
                                      Dialog(
                                        child: Form(
                                          key: _formkey1,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                        right: ScreenUtil()
                                                            .setWidth(6),
                                                      ),
                                                      child: CircleAvatar(
                                                        backgroundColor:
                                                            Color(0xff838383),
                                                        radius: 13.r,
                                                        child: Icon(
                                                          Icons.close,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: ScreenUtil()
                                                        .setWidth(15)),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: ScreenUtil()
                                                              .setWidth(50)),
                                                      child: Text(
                                                        "Forgot password",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize:
                                                                ScreenUtil()
                                                                    .setSp(25)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: ScreenUtil()
                                                        .setWidth(5)),
                                                child: Text(
                                                  "Enter your email for the verification process,\n And send Otp password to your Email/phone",
                                                  style: TextStyle(
                                                      fontSize: ScreenUtil()
                                                          .setSp(12),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xff677294)),
                                                ),
                                              ),
                                              SizedBox(
                                                height:
                                                    ScreenUtil().setHeight(40),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: ScreenUtil()
                                                        .setWidth(15)),
                                                child: TextFormField(
                                                  controller:
                                                      myController.forgotemail,
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  validator: (msg) {
                                                    if (msg == null ||
                                                        msg.isEmpty) {
                                                      return 'Please enter an email';
                                                    }
                                                    const String email =
                                                        "tony@starkindustries.com";
                                                    final bool emailValid =
                                                        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                            .hasMatch(msg);
                                                    if (!emailValid) {
                                                      return 'Please enter a valid email';
                                                    }
                                                    return null;
                                                  },
                                                  decoration: InputDecoration(
                                                      hintText: 'Email',
                                                      prefixIcon: Icon(
                                                        Icons.email_outlined,
                                                        color: Colors.green,
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10))),
                                                ),
                                              ),
                                              SizedBox(
                                                height:
                                                    ScreenUtil().setHeight(50),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(15),
                                                child: Common_button(
                                                    name: 'Send Now',
                                                    onTap: () {
                                                      if (_formkey1
                                                          .currentState!
                                                          .validate()) {
                                                        myController.sendOtp();
                                                        Navigator.pop(context);
                                                        Get.dialog(Dialog(
                                                          child: Form(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.only(right: ScreenUtil().setWidth(6)),
                                                                        child:
                                                                            CircleAvatar(
                                                                          backgroundColor:
                                                                              Color(0xff838383),
                                                                          radius:
                                                                              13,
                                                                          child:
                                                                              Icon(
                                                                            Icons.close,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets.only(
                                                                      left: ScreenUtil()
                                                                          .setWidth(
                                                                              15)),
                                                                  child: Row(
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.only(left: ScreenUtil().setWidth(50)),
                                                                        child:
                                                                            Text(
                                                                          "Forgot password",
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontSize: ScreenUtil().setSp(25)),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              5.0),
                                                                  child:
                                                                      Container(
                                                                    child: Text(
                                                                      'Otp was send to your Email/phone',
                                                                      style: TextStyle(
                                                                          fontSize: ScreenUtil().setSp(
                                                                              14),
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          fontFamily:
                                                                              'FontMain',
                                                                          color:
                                                                              Color(0xff677294)),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  child: Text(
                                                                    ' for verification',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            ScreenUtil().setSp(
                                                                                14),
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontFamily:
                                                                            'FontMain',
                                                                        color: Color(
                                                                            0xff677294)),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 222,
                                                                  height: 46,
                                                                ),
                                                                Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      child:
                                                                          OTPTextField(
                                                                        length:
                                                                            4,
                                                                        width:
                                                                            270,
                                                                        fieldWidth:
                                                                            39,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                17,
                                                                            color:
                                                                                Color(0xff53B175),
                                                                            fontFamily: 'FontMain'),
                                                                        textFieldAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        fieldStyle:
                                                                            FieldStyle.underline,
                                                                        onCompleted:
                                                                            (pin) {
                                                                          myController
                                                                              .verifyotp
                                                                              .text = pin;
                                                                          print("Completed: " +
                                                                              pin);
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 40,
                                                                  width: 220.2,
                                                                ),
                                                                Container(
                                                                    child:
                                                                        RichText(
                                                                  text: TextSpan(
                                                                      style: TextStyle(
                                                                        color: Color(
                                                                            0xff55836F),
                                                                        fontSize:
                                                                            16,
                                                                      ),
                                                                      children: <TextSpan>[
                                                                        TextSpan(
                                                                          text:
                                                                              'If you don’t get OTP then?',
                                                                        ),
                                                                        TextSpan(
                                                                            text:
                                                                                ' Resend',
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 20,
                                                                              color: Color(0xff3F2037),
                                                                            ),
                                                                            recognizer: TapGestureRecognizer()
                                                                              ..onTap = () {}),
                                                                      ]),
                                                                )),
                                                                SizedBox(
                                                                  height: 23,
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          15.0),
                                                                  child:
                                                                      Common_button(
                                                                    name:
                                                                        'Submit',
                                                                    onTap: () {
                                                                      myController
                                                                          .verifyOtp();
                                                                      Navigator.pop(
                                                                          context);
                                                                      Get.dialog(
                                                                          Dialog(
                                                                        child:
                                                                            Form(
                                                                          key:
                                                                              _formkey2,
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  InkWell(
                                                                                    onTap: () {
                                                                                      Navigator.pop(context);
                                                                                    },
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsets.only(
                                                                                        right: 6.0,
                                                                                      ),
                                                                                      child: CircleAvatar(
                                                                                        backgroundColor: Color(0xff838383),
                                                                                        radius: 13,
                                                                                        child: Icon(
                                                                                          Icons.close,
                                                                                          color: Colors.white,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  )
                                                                                ],
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsets.only(left: 15),
                                                                                child: Row(
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: const EdgeInsets.only(left: 40),
                                                                                      child: Text(
                                                                                        "Change password",
                                                                                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsets.only(left: 5.0),
                                                                                child: Text(
                                                                                  "Enter your New password",
                                                                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xff677294)),
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 30,
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsets.only(left: 25, right: 25),
                                                                                child: TextFormField(
                                                                                  controller: myController.newPassword,
                                                                                  style: TextStyle(fontFamily: 'Be Vietnam '),
                                                                                  textInputAction: TextInputAction.next,
                                                                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                                                                  validator: (msg) {
                                                                                    if (msg == null || msg.isEmpty) {
                                                                                      return "Please Create Password";
                                                                                    } else if (msg.length < 6) {
                                                                                      return "Password should be atleast 6 character";
                                                                                    } else if (msg.length > 15) {
                                                                                      return "Password should not be greater than 15 characters";
                                                                                    } else
                                                                                      return null;
                                                                                  },
                                                                                  obscureText: _obscureText ? true : false,
                                                                                  decoration: InputDecoration(
                                                                                      hintText: 'Enter New Password',
                                                                                      prefixIcon: Icon(
                                                                                        Icons.lock_outlined,
                                                                                        color: Colors.green,
                                                                                      ),
                                                                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 15.sp,
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsets.only(left: 25, right: 25),
                                                                                child: TextFormField(
                                                                                  controller: myController.newConfirmPassword,
                                                                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                                                                  validator: (msg) {
                                                                                    if (msg == null || msg.isEmpty) {
                                                                                      return "Please Enter Confirm Password";
                                                                                    } else if (myController.newPassword.text != myController.newConfirmPassword.text) {
                                                                                      return "Password Do Not Match";
                                                                                    }
                                                                                    return null;
                                                                                  },
                                                                                  obscureText: _obscureText ? true : false,
                                                                                  decoration: InputDecoration(
                                                                                      hintText: 'Enter Confirm Password',
                                                                                      prefixIcon: Icon(
                                                                                        Icons.lock_outlined,
                                                                                        color: Colors.green,
                                                                                      ),
                                                                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                                                                                ),
                                                                              ),
                                                                              // SizedBox(
                                                                              //   height: 40,
                                                                              //   width: 220.2,
                                                                              // ),
                                                                              SizedBox(
                                                                                height: 20.sp,
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsets.all(18.0),
                                                                                child: Common_button(
                                                                                    name: 'Done',
                                                                                    onTap: () {
                                                                                      myController.changePassword();
                                                                                      if (_formkey2.currentState!.validate()) {
                                                                                        Navigator.pop(context);

                                                                                        myController.newPassword.clear();
                                                                                        myController.newConfirmPassword.clear();
                                                                                      }
                                                                                    }),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ));
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ));
                                                      }
                                                    }),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ));
                                },
                                child: Center(
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                        fontSize: ScreenUtil().setSp(24),
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff3F2037)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(15),
                            // width: 100,
                          ),
                          Obx(
                            () => Center(
                              child: Common_button(
                                isLoading: myController.isLoading.value,
                                onTap: () {
                                  if ((checkValidation(
                                          myController.email.text)) &&
                                      (myController.password.text.length >=
                                          8)) {
                                    if (myController.isLoading.value == false) {
                                      print("heloo");
                                      myController.loginapi(context);
                                    }
                                  } else {
                                    if (!checkValidation(
                                        myController.email.text)) {
                                      setState(() {
                                        emailError = true;
                                        invalidEmailError = true;
                                      });
                                    }
                                    if (myController.password.text.length < 8) {
                                      setState(() {
                                        passwordrequired = true;
                                      });
                                    }
                                  }
                                },
                                name: 'Sign In',
                              ),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                'Or',
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(24),
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              width: ScreenUtil().setWidth(200),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: Image.asset(
                                        'assets/images/goolge.png',
                                        width: ScreenUtil().setWidth(30.57),
                                        height: ScreenUtil().setHeight(35)),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Image.asset(
                                      'assets/images/fb.png',
                                      width: ScreenUtil().setWidth(35.57),
                                      height: ScreenUtil().setHeight(36),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                                child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                    color: Color(0xff55836F),
                                    fontSize: ScreenUtil().setSp(16),
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Don’t have an account?',
                                    ),
                                    TextSpan(
                                        text: ' Sign up',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: ScreenUtil().setSp(20),
                                          color: Color(0xff3F2037),
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Myregister()));
                                          }),
                                  ]),
                            )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  bool checkValidation(msg) {
    const String email = "tony@starkindustries.com";
    print(email.toString());
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(msg);

    if (emailValid == false) {
      print(emailValid.toString());
      setState(() {
        emailError = true;
        invalidEmailError = true;
      });
    } else {
      setState(() {
        invalidEmailError = false;
        emailError = false;
      });
    }
    return emailValid;
  }

  void validationCheck(msg) {
    if (msg == null || msg.isEmpty) {
      setState(() {
        passwordrequired = true;
      });
    } else {
      setState(() {
        passwordrequired = false;
      });
    }
  }
}
