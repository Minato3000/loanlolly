import 'package:flutter/material.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String errorMessage;

  ErrorMessageWidget({required this.errorMessage});

  String getMessage() {
    if (errorMessage.contains('(auth/invalid-email)')) {
      return "Invalid email address";
    } else if (errorMessage.contains('(auth/user-not-found)')) {
      return "User not found";
    } else if (errorMessage.contains('(auth/wrong-password)')) {
      return "Invalid password";
    } else if (errorMessage.contains('(auth/email-already-in-use)')) {
      return "Email is already in use";
    } else if (errorMessage.contains('(auth/weak-password)')) {
      return "Password is too weak";
    } else if (errorMessage.contains('(auth/too-many-requests)')) {
      return "Too many login attempts. Try again later";
    } else if (errorMessage.contains('(auth/operation-not-allowed)')) {
      return "This operation is not allowed";
    } else if (errorMessage.contains('(auth/account-exists-with-different-credential)')) {
      return "An account already exists with the same email but different sign-in credentials";
    } else if (errorMessage.contains('(auth/network-request-failed)')) {
      return "Network request failed. Check your internet connection";
    } else if (errorMessage.contains('(auth/invalid-credential)')) {
      return "Invalid credentials. Please check your email and password";
    } else if (errorMessage.contains('(auth/missing-password)')) {
      return "Password is required";
    } else if (errorMessage.contains('(auth/user-disabled)')) {
      return "This account has been disabled";
    } else if (errorMessage.contains('(auth/user-token-expired)')) {
      return "The user's credential is no longer valid. Sign in again";
    } else if (errorMessage.contains('(auth/provider-already-linked)')) {
      return "The account is already linked to another credential";
    } else if (errorMessage.contains('(auth/credential-already-in-use)')) {
      return "The credential is already associated with another user account";
    } else if (errorMessage.contains('(auth/invalid-verification-id)')) {
      return "The verification ID used to create the phone authentication credential is invalid";
    } else {
      return errorMessage;
    }
  }


  void showSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.white,
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Text(
              getMessage(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showSnackBar(context);
    });

    return SizedBox.shrink();
  }
}
