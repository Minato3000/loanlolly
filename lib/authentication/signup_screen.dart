import 'package:flutter/material.dart';
import 'package:loanlolly/constants.dart';
import 'package:loanlolly/screens/home_screen.dart';
import 'package:loanlolly/widgets/custom_button_widget.dart';
import 'package:loanlolly/widgets/custom_error_message.dart';
import 'package:loanlolly/widgets/custom_image_widget.dart';
import 'package:loanlolly/widgets/custom_text_input_widget.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:loanlolly/authentication/auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key?key}):super(key:key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? errorMessage = '';

  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerConfirmPassword = TextEditingController();

  Future<void> createUserWithEmailAndPassword() async {
  try {
    if (_controllerPassword.text == _controllerConfirmPassword.text) {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );

      User? user = FirebaseAuth.instance.currentUser;

      await user?.updateDisplayName(_controllerUsername.text);
      await user?.reload(); 

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(), 
        ),
      );

    } else {
      setState(() {
        errorMessage = "Passwords do not match";
      });
    }
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
          // Translucent Background Image
          Image.asset(
            'assets/images/llbg.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 400.0, // Adjust the left padding as needed
                ),
                child: ImageWidget(imagePath: 'assets/images/logo.png'),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 56,
                          color: AppConstants.whiteColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppConstants.robotoFontFamily,
                        ),
                      ),
                      SizedBox(height: 50),
                      TextInputWidget(
                        labelText: 'Username',
                        textEditingController: _controllerUsername,
                      ),
                      SizedBox(height: 20),
                      TextInputWidget(
                        labelText: 'Email',
                        textEditingController: _controllerEmail,
                      ),
                      SizedBox(height: 20),
                      TextInputWidget(
                        labelText: 'Password',
                        textEditingController: _controllerPassword,
                        obscureText: true,
                      ),
                      SizedBox(height: 20),
                      TextInputWidget(
                        labelText: 'Confirm Password',
                        textEditingController: _controllerConfirmPassword,
                        obscureText: true,
                      ),
                      SizedBox(height: 20),
                      CustomButtonWidget(
                        onPressed: () async {
                          await createUserWithEmailAndPassword();
                        },
                        buttonText: 'Signup',
                      ),
                      SizedBox(height: 20),
                      if (errorMessage != "")
                        ErrorMessageWidget(errorMessage: errorMessage!),  
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
