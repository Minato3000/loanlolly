import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loanlolly/constants.dart';
import 'package:loanlolly/widgets/custom_card_widget.dart';
import 'package:fl_chart/fl_chart.dart';

class BorrowerScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Hello ${user?.displayName ?? ''}!',
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ),
                ),

                Card(
                  margin: EdgeInsets.all(16.0),
                  child: Container(
                    height: 200, 
                    decoration: BoxDecoration(
                      color: Color.fromARGB(228, 14, 31, 127),
                      borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
                    ),
                    child: PieChart(
                      PieChartData(
                        sectionsSpace: 0,
                        centerSpaceRadius: 30,
                        sections: [
                          PieChartSectionData(
                            color: Colors.green,
                            value: 80,
                            title: 'Borrowed',
                            radius: 40,
                            titleStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xffffffff)),
                          ),
                          PieChartSectionData(
                            color: const Color.fromARGB(255, 233, 27, 12),
                            value: 20,
                            title: 'Returned',
                            radius: 40,
                            titleStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xffffffff)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Second Column
          Expanded(
            child: ListView(
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Active Borrowings',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
                    CardWidget(
                      name: 'John Doe',
                      month: '12',
                      price: '\$500',
                      percentage: '50%',
                    ),
                    CardWidget(
                      name: 'Jane Smith',
                      month: '24',
                      price: '\$800',
                      percentage: '75%',
                    ),
                    CardWidget(
                      name: 'Bob Johnson',
                      month: '6',
                      price: '\$300',
                      percentage: '60%',
                    ),
                    CardWidget(
                      name: 'Alice Williams',
                      month: '18',
                      price: '\$1000',
                      percentage: '90%',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
