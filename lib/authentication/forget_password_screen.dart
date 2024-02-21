import 'package:flutter/material.dart';
import 'package:loanlolly/authentication/login_screen.dart';
import 'package:loanlolly/constants.dart';
import 'package:loanlolly/widgets/custom_error_message.dart';
import 'package:loanlolly/widgets/custom_button_widget.dart';
import 'package:loanlolly/widgets/custom_image_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loanlolly/widgets/custom_text_input_widget.dart';

class ForgetPassScreen extends StatefulWidget {
  @override
  _ForgetPassScreenState createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  String? errorMessage;
  final TextEditingController _controllerEmail = TextEditingController();

  Future<void> _resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(), 
        ),
      );    
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/images/llbg.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageWidget(imagePath: 'assets/images/logo.png'),
                  const SizedBox(height: 10),
                  const Text(
                    'Reset Password',
                    style: TextStyle(
                      fontSize: 42,
                      color: AppConstants.whiteColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppConstants.robotoFontFamily,
                    ),
                  ),
                  const SizedBox(height: 50),                  
                  TextInputWidget(labelText: 'Email', textEditingController: _controllerEmail,),
                  const SizedBox(height: 10),
                  CustomButtonWidget(
                    onPressed: () {
                      _resetPassword(_controllerEmail.text);
                    },
                    buttonText: 'Reset Password',
                  ),
                  if (errorMessage != null)
                    ErrorMessageWidget(errorMessage: errorMessage!),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
