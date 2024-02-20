import 'package:flutter/material.dart';
import 'package:loanlolly/constants.dart';
import 'package:loanlolly/widgets/custom_card_widget.dart';
import 'package:fl_chart/fl_chart.dart';

class LenderHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // First Column
          Expanded(
            child: Column(
              children: [
                // Placeholder for the "Hello Boy" text
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Hello Boy',
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ),
                ),

                // Placeholder for the pie chart
                Card(
                  margin: EdgeInsets.all(16.0),
                  child: Container(
                    height: 200, // Set the desired height for your pie chart
                    // Create a custom pie chart with specific values using fl_chart
                    child: PieChart(
                      PieChartData(
                        sectionsSpace: 0,
                        centerSpaceRadius: 30,
                        sections: [
                          PieChartSectionData(
                            color: AppConstants.blueColor,
                            value: 30,
                            title: 'Q1',
                            radius: 40,
                            titleStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xffffffff)),
                          ),
                          PieChartSectionData(
                            color: Colors.green,
                            value: 20,
                            title: 'Q2',
                            radius: 40,
                            titleStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xffffffff)),
                          ),
                          PieChartSectionData(
                            color: Colors.orange,
                            value: 25,
                            title: 'Q3',
                            radius: 40,
                            titleStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xffffffff)),
                          ),
                          PieChartSectionData(
                            color: Colors.red,
                            value: 25,
                            title: 'Q4',
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
                          'Active Lendings',
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
                    // Add more CardWidget placeholders as needed
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
