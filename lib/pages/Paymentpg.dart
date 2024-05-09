import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gomart/utils/svg_string.dart';
import '../api_controller/OrderController.dart';
import '../api_controller/addressCongtroller.dart';
import '../api_controller/cartController.dart';
import '../component/dropdown_month.dart';
import '../component/dropdown_year.dart';
import 'Paymentpgdone.dart';

class Paymentpg extends StatefulWidget {
  const Paymentpg({super.key});

  @override
  State<Paymentpg> createState() => _PaymentpgState();
}

class _PaymentpgState extends State<Paymentpg> {
  var orderController = Get.put(OrderController());
  var cartController = Get.put(CartController());
  var addController = Get.put(AddressControlller());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int _type = 1;

  void _handleRadio(Object? e) => setState(() {
        _type = e as int;
      });

  @override
  void initState() {
    super.initState();
  }

  bool? ischecked = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          top: -100,
          left: -90,
          child: Image(
              height: 603.21,
              width: 504.22,
              image: AssetImage('assets/images/addbg.png')),
        ),
        Column(children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 15),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.string(arrowback),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40, left: 260),
                    child: Image(
                        height: 35,
                        width: 40,
                        image: AssetImage('assets/images/cartimg.png')),
                  )
                ],
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 140),
                child: Container(
                    child: Text(
                  'Payment',
                  style: TextStyle(
                    color: Color(0xFF3F2037),
                    fontSize: 27,
                    fontWeight: FontWeight.w700,
                  ),
                )),
              )
            ],
          ),
        ]),
        Padding(
          padding: const EdgeInsets.only(top: 160),
          child: SingleChildScrollView(
            child: Column(children: [
              Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 15, top: 5),
                      child: Text(
                        'Select Payment Method',
                        style: TextStyle(
                          color: Color(0xFF828282),
                          fontSize: 18,
                          fontFamily: 'Be Vietnam',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ))
                ],
              ),
              Container(
                height: 250,
                width: 370,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.3),
                        offset: Offset(1.0, 1.0),
                        blurRadius: 5,
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: Colors.white.withOpacity(0.3),
                        offset: Offset(-1.0, -1.0),
                        blurRadius: 5,
                        spreadRadius: 0,
                      )
                    ]),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 320,
                          height: 55,
                          margin: EdgeInsets.only(right: 10, left: 20, top: 15),
                          decoration: BoxDecoration(
                              border: _type == 1
                                  ? Border.all(width: 1, color: Colors.blue)
                                  : Border.all(width: 0.3, color: Colors.grey),
                              borderRadius: BorderRadius.circular(7),
                              boxShadow: [BoxShadow(color: Colors.transparent)],
                              color: Colors.transparent),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Radio(
                                        value: 1,
                                        groupValue: _type,
                                        onChanged: _handleRadio,
                                        activeColor: Colors.grey),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 25),
                                      child: Text(
                                        'Pay With',
                                        style: _type == 1
                                            ? TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey)
                                            : TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 25),
                                      child: Image.asset(
                                        'assets/images/payimg1.png',
                                        width: 50,
                                        height: 50,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 320,
                          height: 55,
                          margin: EdgeInsets.only(right: 10, left: 20, top: 10),
                          decoration: BoxDecoration(
                              border: _type == 2
                                  ? Border.all(width: 1, color: Colors.blue)
                                  : Border.all(width: 0.3, color: Colors.grey),
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.transparent),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Radio(
                                        value: 2,
                                        groupValue: _type,
                                        onChanged: _handleRadio,
                                        activeColor: Colors.grey),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 25),
                                      child: Text(
                                        'Pay With',
                                        style: _type == 2
                                            ? TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey)
                                            : TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 25),
                                      child: Image.asset(
                                        'assets/images/cardimg1.png',
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                    Image.asset('assets/images/cardimg2.png'),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                          'assets/images/cardimg3.png'),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 320,
                          height: 55,
                          margin: EdgeInsets.only(right: 10, left: 20, top: 10),
                          decoration: BoxDecoration(
                              border: _type == 3
                                  ? Border.all(width: 1, color: Colors.blue)
                                  : Border.all(width: 0.3, color: Colors.grey),
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.transparent),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Radio(
                                        value: 3,
                                        groupValue: _type,
                                        onChanged: _handleRadio,
                                        activeColor: Colors.grey),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 25),
                                      child: Text(
                                        'Pay With',
                                        style: _type == 3
                                            ? TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey)
                                            : TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 25),
                                      child: Image.asset(
                                        'assets/images/payimg4.png',
                                        width: 50,
                                        height: 50,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      'Enter Card Details',
                      style: TextStyle(
                        color: Color(0xFF575C55),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(16),
                          CreditCardNumberFormater()
                        ],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Card Number',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Color(0xFF838383))),
                        validator: (value) {
                          var newvalue =
                              value.toString().replaceAll(RegExp(r"\s+"), "");
                          if (value == null || value.isEmpty) {
                            return 'Please enter card number';
                          }
                          if (newvalue.length < 16) {
                            return 'Please enter a valid card number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Dropdown_month(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select month';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            width: 94,
                          ),
                          Dropdown_year(),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 250),
                        child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(3),
                          ],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: 'CVV',
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Color(0xFF838383))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter CVV';
                            }
                            if (value.length != 3) {
                              return 'Enter a valid code';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          children: [
                            Checkbox(
                                value: ischecked,
                                activeColor: Colors.green,
                                onChanged: (newBool) {
                                  setState(() {
                                    ischecked = newBool;
                                  });
                                }),
                            Text(
                              'Save Car into for quick payment in future',
                              style: TextStyle(
                                color: Color(0xFF828282),
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate() &&
                              ischecked == true) {
                            orderController.addOrderApi(
                                cartController.getCartItem,
                                addController.address);
                          }
                        },
                        child: Container(
                          height: 57,
                          width: 342,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.green),
                          child: Center(
                            child: Text(
                              'Next',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
              )
            ]),
          ),
        ),
      ],
    ));
  }
}

class CreditCardNumberFormater extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    String enteredData = newValue.text;
    StringBuffer buffer = StringBuffer();
    for (int i = 0; i < enteredData.length; i++) {
      buffer.write(enteredData[i]);
      int index = i + 1;
      if (index % 4 == 0 && enteredData.length != index) {
        buffer.write(" ");
      }
    }

    return TextEditingValue(
        text: buffer.toString(),
        selection: TextSelection.collapsed(
            offset: buffer.toString().length) // keep the cursor at end
        );
  }
}
