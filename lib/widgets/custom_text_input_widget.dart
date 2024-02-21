import 'package:flutter/material.dart';
import 'package:loanlolly/constants.dart';

class TextInputWidget extends StatelessWidget {
  final String labelText;
  final TextEditingController textEditingController;
  final bool obscureText;

  TextInputWidget({
    required this.labelText, required this.textEditingController, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Container(
        decoration: BoxDecoration(
          color: AppConstants.lightGreyColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: TextFormField(
          controller: textEditingController,
          cursorColor: AppConstants.whiteColor,
          style: TextStyle(
            color: AppConstants.whiteColor,
            fontFamily: AppConstants.robotoFontFamily,
          ),
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: labelText,
            contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            labelStyle: TextStyle(
              fontSize: 16,
              color: AppConstants.lightGreyColor,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppConstants.transparentColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppConstants.transparentColor),
            ),
            filled: true,
            fillColor: AppConstants.transparentColor,
          ),
        ),
      ),
    );
  }
}