import 'package:flutter/material.dart';
import 'package:loanlolly/widgets/custom_appbar_widget.dart';
import 'package:loanlolly/widgets/custom_drawer.dart';
import 'package:loanlolly/widgets/custom_approval_card_widget.dart';

class LoanHistoryScreen extends StatefulWidget {
  const LoanHistoryScreen({Key? key});

  @override
  State<LoanHistoryScreen> createState() => _LoanHistoryScreenState();
}

class _LoanHistoryScreenState extends State<LoanHistoryScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey, headerText: "History", onTap: () {}),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Loan History',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Column(
                  children: [
                    Text(
                      'High Amount Loans',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    ApprovalCardWidget(
                      name: 'John Doe',
                      month: '12',
                      price: '\$50000',
                      description: 'Description of loan 1',
                      onApprove: () {},
                    ),
                    ApprovalCardWidget(
                      name: 'Jane Smith',
                      month: '24',
                      price: '\$80000',
                      description: 'Description of loan 2',
                      onApprove: () {},
                    ),
                    ApprovalCardWidget(
                      name: 'Alice Williams',
                      month: '18',
                      price: '\$100000',
                      description: 'Description of loan 3',
                      onApprove: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Text(
                  'Small Amount Loans',
                  style: TextStyle(fontSize: 20.0),
                ),
                Column(
                  children: [
                    ApprovalCardWidget(
                      name: 'Bob Johnson',
                      month: '6',
                      price: '\$300',
                      description: 'Description of loan request 4',
                      onApprove: () {},
                    ),
                    ApprovalCardWidget(
                      name: 'Alice Williams',
                      month: '18',
                      price: '\$1000',
                      description: 'Description of loan request 5',
                      onApprove: () {},
                    ),
                    ApprovalCardWidget(
                      name: 'Alex James',
                      month: '18',
                      price: '\$1000',
                      description: 'Description of loan request 6',
                      onApprove: () {},
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
