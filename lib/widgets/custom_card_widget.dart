import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String name;
  final String month;
  final String percentage;
  final String price;

  CardWidget({
    required this.name,
    required this.month,
    required this.percentage,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // First Column
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text('$price'),
                  SizedBox(height: 8.0),
                  Text('$month'),
                ],
              ),
            ),

            // Second Column
            // Second Column
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Use an Ink widget to customize splash effect without extra padding
                  Ink(
                    decoration: ShapeDecoration(
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.chat),
                      color: Color.fromARGB(255, 2, 35, 62), // Customize the icon color
                      onPressed: () {
                        // Handle message button click
                      },
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text('$percentage  '),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
