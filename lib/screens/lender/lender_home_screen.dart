import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loanlolly/constants.dart';
import 'package:loanlolly/widgets/custom_card_widget.dart';
import 'package:fl_chart/fl_chart.dart';

class LenderHomeScreen extends StatefulWidget {
  const LenderHomeScreen({Key? key});

  @override
  State<LenderHomeScreen> createState() => _LenderHomeScreenState();
}

class _LenderHomeScreenState extends State<LenderHomeScreen> {
  late User? user;
  late String _userMail;
  double _lentAmount = 0.0;
  double _returnedAmount = 0.0;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    _userMail = user?.email ?? "";
    _calculateAmounts();
  }

  Future<QuerySnapshot> _getLoanDocuments() async {
    return FirebaseFirestore.instance
        .collection('Loan')
        .where('lenderid', isEqualTo: _userMail)
        .get();
  }

  Future<void> _calculateAmounts() async {
    print("Calculating amounts...");
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Loan')
          .where('lenderid', isEqualTo: _userMail)
          .get();

      double lentAmount = 0.0;
      double returnedAmount = 0.0;

      querySnapshot.docs.forEach((DocumentSnapshot document) {
        var loan = document.data() as Map<String, dynamic>;
        lentAmount += (loan['amount'] is int) ? (loan['amount'] as int).toDouble() : loan['amount'];
        returnedAmount += (loan['returned'] is int) ? (loan['returned'] as int).toDouble() : loan['returned'];
      });

      setState(() {
        _lentAmount = lentAmount;
        _returnedAmount = returnedAmount;
      });
      
      print("Lent Amount: $_lentAmount, Returned Amount: $_returnedAmount");
    } catch (error) {
      print("Error calculating amounts: $error");
    }
  }



  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getLoanDocuments(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          return Row(
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
                        height: 400,
                        decoration: BoxDecoration(
                          color: AppConstants.blueColor,
                          borderRadius: BorderRadius.circular(
                              AppConstants.defaultBorderRadius),
                        ),
                        child: PieChart(
                          PieChartData(
                            sectionsSpace: 0,
                            centerSpaceRadius: 60,
                            startDegreeOffset: -60,
                            sections: [
                              PieChartSectionData(
                                title: 'Returned\n${_returnedAmount.toStringAsFixed(2)}', // Display title, value, and percentage
                                color: Colors.green,
                                value: _returnedAmount,
                                radius: 50,
                                titleStyle: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xffffffff),
                                ),
                                titlePositionPercentageOffset: 1.5, // Adjust title position
                              ),
                              PieChartSectionData(
                                title: 'Pending\n${(_lentAmount - _returnedAmount).toStringAsFixed(2)}',
                                color: const Color.fromARGB(255, 233, 27, 12),
                                value: _lentAmount - _returnedAmount,
                                radius: 50,
                                titleStyle: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xffffffff),
                                ),
                                titlePositionPercentageOffset: 1.5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Expanded(
              //   child: ListView(
              //     children: snapshot.data!.docs.map((DocumentSnapshot document) {
              //       var loan = document.data() as Map<String, dynamic>;
              //       return CardWidget(
              //         name: loan['borrowerid'].toString(),
              //         month: loan['months'].toString(),
              //         price: loan['amount'].toString(),
              //         percentage: loan['rate'].toString(),
              //       );
              //     }).toList(),
              //   ),
              // )
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
                        // Dynamically generated CardWidgets based on Firestore data
                        for (var loan in snapshot.data!.docs)
                          CardWidget(
                            name: loan['borrowerid'].toString(),
                            month: loan['months'].toString(),
                            price: loan['amount'].toString(),
                            percentage: loan['rate'].toString(),
                          ),
                      ],
                    ),
                  ],
                ),
              ),

            ],
          );
        }
      },
    );
  }
}
