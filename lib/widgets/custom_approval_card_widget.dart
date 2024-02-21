import 'package:flutter/material.dart';

class ApprovalCardWidget extends StatelessWidget {
  final String name;
  final String month;
  final String description;
  final String price;
  final VoidCallback onApprove;

  ApprovalCardWidget({
    required this.name,
    required this.month,
    required this.description,
    required this.price,
    required this.onApprove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  Text('$description'),
                ],
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('$price'),
                  SizedBox(height: 8.0),
                  Text('$month'),
                  SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: onApprove,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 35, 117, 37)),
                    ),
                    child: Text('Approve', style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
