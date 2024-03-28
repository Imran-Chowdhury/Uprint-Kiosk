

import 'package:flutter/material.dart';




Widget roundedTextField(Color highlightcolor, height, double width, String labelText,
    { TextEditingController? textcontroller, bool isPassword = false, String? Function(String?)? validator}) {
  return TextFormField(
    controller: textcontroller ,
    obscureText: isPassword,
    decoration: InputDecoration(
      labelText: labelText,
      focusedBorder: OutlineInputBorder(
        borderSide:  BorderSide(
          color: highlightcolor,
          // Colors.blue,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(height * 0.023),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black.withOpacity(0.2),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(height * 0.023),
      ),
    ),
    validator: validator,
  );
}