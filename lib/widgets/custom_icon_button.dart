import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData iconData; // Updated to use IconData
  final String title;
  final VoidCallback onTap;
  final bool showArrow;
  final double customWidth;

  CustomIconButton({
    required this.iconData, // Updated to use IconData
    required this.title,
    required this.onTap,
    this.showArrow = false,
    this.customWidth = 250,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(0, 1),
                  blurRadius: 12,
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 50,
          width: customWidth,
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            child: InkWell(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Icon(iconData), // Using Icon widget instead of Image.asset
                    SizedBox(width: 8),
                    Text(title),
                    if (showArrow) ...[
                      Spacer(),
                      Icon(
                        Icons.arrow_forward, // Replace with the desired arrow icon
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
