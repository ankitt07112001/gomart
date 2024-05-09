import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNumberFormField extends StatefulWidget {
  final TextEditingController controller;

  const PhoneNumberFormField({Key? key, required this.controller})
      : super(key: key);

  @override
  _PhoneNumberFormFieldState createState() => _PhoneNumberFormFieldState();
}

class _PhoneNumberFormFieldState extends State<PhoneNumberFormField> {
  // Regular expression pattern for validating mobile numbers
  static final mobileNumberPattern = RegExp(r'^[6-9][0-9]{9}$|^5[0-9]{8}$');

  String? validateMobileNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter a valid phone number';
    } else if (!mobileNumberPattern.hasMatch(value)) {
      return 'Invalid phone number';
    }
    return null; // Return null if validation passes
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: TextStyle(fontFamily: 'Be Vietnam'),
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      inputFormatters: <TextInputFormatter>[
        LengthLimitingTextInputFormatter(10),
        // FilteringTextInputFormatter.allow(RegExp(r'^[6-9][0-9]*$')), // Modified regex
        FilteringTextInputFormatter.digitsOnly
      ],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validateMobileNumber, // Using custom validation function
      decoration: InputDecoration(
        hintText: 'Phone Number',
        prefixIcon: Icon(
          Icons.phone,
          color: Colors.green,
        ),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
