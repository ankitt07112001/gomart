import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gomart/pages/Registation_otp.dart';
import 'package:gomart/component/button.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../component/button1.dart';
import 'change_password.dart';

class Myotp extends StatefulWidget {
  const Myotp({super.key});

  @override
  State<Myotp> createState() => _MyotpState();
}

class _MyotpState extends State<Myotp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Form(
          child: Column(
            children: [
              Image.asset('assets/images/login.png'),
              Container(
                child: Text(
                  'Forgot password',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'FontMain',
                      letterSpacing: -0.3,
                      color: Color(0xff3F2037)),
                ),
              ),
              Container(
                child: Text(
                  'Otp was send to your Email/phone',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'FontMain',
                      color: Color(0xff677294)),
                ),
              ),
              Container(
                child: Text(
                  ' for verification',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'FontMain',
                      color: Color(0xff677294)),
                ),
              ),
              SizedBox(
                width: 222,
                height: 46,
              ),
              Form(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: OTPTextField(
                      length: 4,
                      width: MediaQuery.of(context).size.width * 0.9,
                      fieldWidth: 39,
                      style: TextStyle(
                          fontSize: 17,
                          color: Color(0xff53B175),
                          fontFamily: 'FontMain'),
                      textFieldAlignment: MainAxisAlignment.spaceEvenly,
                      fieldStyle: FieldStyle.underline,
                      onCompleted: (pin) {
                        print("Completed: " + pin);
                      },
                    ),
                  ),
                ],
              )),
              SizedBox(
                height: 40,
                width: 220.2,
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
                height: 23,
              ),
              Common_button(
                name: 'Submit',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Mypassword()));
                  print('Clicked button');
                },
              ),
              Container(
                child: Text(
                  'Or',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Image.asset(
                        'assets/images/apple.png',
                        width: 30,
                        height: 35,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Image.asset('assets/images/goolge.png',
                          width: 30.57, height: 35),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Image.asset(
                        'assets/images/fb.png',
                        width: 30,
                        height: 42,
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
                          text: 'Don’t have an account?',
                        ),
                        TextSpan(
                            text: ' Sign up',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xff3F2037),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('you Tapped');
                              }),
                      ]),
                ),
              ),
              SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
