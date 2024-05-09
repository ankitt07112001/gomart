import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gomart/api_controller/controller.dart';
import 'package:gomart/component/button.dart';
import 'package:gomart/pages/login.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../component/button1.dart';

class Myregotp extends StatefulWidget {
  const Myregotp({super.key});

  @override
  State<Myregotp> createState() => _MyregotpState();
}

class _MyregotpState extends State<Myregotp> {
  var myController = Get.put(Controller());
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Image.asset('assets/images/login.png'),
              Container(
                  child: Text(
                'Registration OTP',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
              )),
              Container(
                child: Text(
                  'Otp was send to your Email/phone',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                child: Text(
                  ' for verification',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 46,
              ),
              Form(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  OTPTextField(
                    length: 4,
                    width: MediaQuery.of(context).size.width * 0.9,
                    fieldWidth: 39.2,
                    style: TextStyle(
                        fontSize: 17,
                        color: Color(0xff53B175),
                        fontFamily: 'FontMain'),
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldStyle: FieldStyle.underline,
                    onCompleted: (pin) {
                      myController.regverifyotp.text = pin;
                    },
                  ),
                ],
              )),
              SizedBox(
                height: 30,
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
                        text: 'If you don’t get OTP then?',
                      ),
                      TextSpan(
                          text: ' Resend',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff3F2037),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('you Tapped');
                            }),
                    ]),
              )),
              SizedBox(
                height: 60,
              ),
              Common_button(
                  name: 'Submit',
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      print("click nhii h");
                      myController.registerverifyOtp();
                      print("click h");
                      // Navigator.pushReplacement(context,
                      //     MaterialPageRoute(builder: (context) => Mylogin()));
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
