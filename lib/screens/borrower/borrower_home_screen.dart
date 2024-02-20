import 'package:flutter/material.dart';

class BorrowerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: Text(
          'This is Borrower Page',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}