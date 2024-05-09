import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gomart/component/button.dart';
import 'package:gomart/utils/svg_string.dart';

import '../component/button1.dart';
import 'otp.dart';

class Myforget extends StatefulWidget {
  const Myforget({super.key});

  @override
  State<Myforget> createState() => _MyforgetState();
}

class _MyforgetState extends State<Myforget> {
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Stack(children: [
                Image.asset('assets/images/login.png'),
                Padding(
                  padding: const EdgeInsets.only(top: 38.0, left: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black54,
                                blurRadius: 4.0,
                                spreadRadius: 0.5)
                          ]),
                      child: SvgPicture.string(
                        arrowback,
                      ),
                    ),
                  ),
                ),
              ]),
              Container(
                  child: Text(
                'Forgot password',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
              )),
              Container(
                child: Text(
                  'Enter your email for the verification process,\n And send Otp password to your Email/phone',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 46,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35, right: 35),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (msg) {
                    const String email = "mailto:tony@starkindustries.com";
                    print(email.toString());
                    final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(msg!);
                    if (emailValid == false) {
                      return 'Please Enter Email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.green,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Common_button(
                  name: 'Send Now',
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Myotp()));
                    }
                    print('Clicked Button');
                  }),
              SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
