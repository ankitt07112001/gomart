import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gomart/component/button.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../component/button1.dart';
import 'Registation_otp.dart';

class Mypassword extends StatefulWidget {
  const Mypassword({super.key});

  @override
  State<Mypassword> createState() => _MypasswordState();
}

class _MypasswordState extends State<Mypassword> {
  TextEditingController _Enter_New_Password = TextEditingController();
  TextEditingController _Enter_Confirm_Password = TextEditingController();
  var _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset('assets/images/login.png'),
              Container(
                child: Text(
                  'Change password',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'FontMain',
                      letterSpacing: -0.3,
                      color: Color(0xff3F2037)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text(
                  'Enter your New password',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'FontMain',
                      color: Color(0xff677294)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: TextFormField(
                  controller: _Enter_New_Password,
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
                  decoration: InputDecoration(
                      hintText: 'Enter New Password',
                      prefixIcon: Icon(
                        Icons.lock_outlined,
                        color: Colors.green,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: TextFormField(
                  controller: _Enter_Confirm_Password,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (msg) {
                    if (msg == null || msg.isEmpty) {
                      return "Please Enter Confirm Password";
                    } else if (_Enter_New_Password.text !=
                        _Enter_Confirm_Password.text) {
                      return "Password Do Not Match";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Enter Confirm Password',
                      prefixIcon: Icon(
                        Icons.lock_outlined,
                        color: Colors.green,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(
                height: 40,
                width: 220.2,
              ),
              SizedBox(
                height: 23,
              ),
              Common_button(
                  name: 'Done',
                  onTap: () {
                    print('Clicked button');

                    if (_formkey.currentState!.validate()) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Myregotp()));

                      print('Clicked button');
                    }
                  }),
            ],
          ),
        ),
      ),
    ));
  }
}
