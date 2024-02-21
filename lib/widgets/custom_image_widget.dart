import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String imagePath;

  ImageWidget({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset(
        imagePath,
      ),
    );
  }
}
