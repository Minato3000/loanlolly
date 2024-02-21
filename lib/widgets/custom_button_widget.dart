import 'package:flutter/material.dart';
import 'package:loanlolly/constants.dart';

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  CustomButtonWidget({required this.onPressed, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppConstants.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppConstants.blueColor,
            fontFamily: AppConstants.robotoFontFamily,
          ),
        ),
      ),
    );
  }
}