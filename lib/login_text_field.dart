import 'package:flutter/material.dart';


class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator<String>? validator;
  final needAsteriks;


  const LoginTextField({Key? key,required this.controller,required this.hintText,this.validator,this.needAsteriks=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: needAsteriks,
      controller: controller,
      validator: (value) {
        if (value != null &&
            value.length < 5 &&
            value.isNotEmpty) {
          return "Your Username should have atleast 5 characters";
        }
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(), hintText: hintText),
    );
  }
}
