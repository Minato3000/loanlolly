import 'package:flutter/material.dart';
import 'package:loanlolly/constants.dart';
import 'package:loanlolly/screens/home_screen.dart';
import 'package:loanlolly/authentication/forget_password_screen.dart';
import 'package:loanlolly/authentication/signup_screen.dart';
import 'package:loanlolly/widgets/custom_error_message.dart';
import 'package:loanlolly/widgets/custom_image_widget.dart';
import 'package:loanlolly/widgets/custom_text_input_widget.dart';
import 'package:loanlolly/widgets/custom_button_widget.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:loanlolly/authentication/auth.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key?key}):super(key:key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  String? errorMessage = '';

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword(BuildContext context) async {
    setState(() {
      errorMessage = '';
    });

    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
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
                  ImageWidget(imagePath: 'assets/images/loginimg.png'),
                  SizedBox(height: 50),
                  TextInputWidget(labelText: 'Email', textEditingController: _controllerEmail,),
                  SizedBox(height: 10),
                  TextInputWidget(labelText: 'Password', textEditingController: _controllerPassword, obscureText: true),
                  SizedBox(height: 20),
                  CustomButtonWidget(
                    onPressed: () => signInWithEmailAndPassword(context),
                    buttonText: 'Login',
                  ),
                  SizedBox(height: 10),
                  if (errorMessage != "")
                    ErrorMessageWidget(errorMessage: errorMessage!), 
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgetPassScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppConstants.whiteColor,
                        decoration: TextDecoration.underline,
                        fontFamily: AppConstants.robotoFontFamily,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Don't Have an Account? Sign Up",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppConstants.whiteColor,
                        decoration: TextDecoration.underline,
                        fontFamily: AppConstants.robotoFontFamily,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
}
