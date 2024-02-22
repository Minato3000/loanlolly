import 'package:flutter/material.dart';
import 'package:loanlolly/widgets/custom_appbar_widget.dart';
import 'package:loanlolly/widgets/custom_drawer.dart';
import 'package:loanlolly/widgets/custom_approval_card_widget.dart';

class LoanApproveScreen extends StatefulWidget {
  const LoanApproveScreen({Key? key});

  @override
  State<LoanApproveScreen> createState() => _LoanApproveScreenState();
}

class _LoanApproveScreenState extends State<LoanApproveScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      appBar: CustomAppBar(scaffoldKey: _scaffoldKey, headerText: "Lend Loans", onTap: () {}),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'New Lend Requests',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Column(
                  children: [
                    ApprovalCardWidget(
                      name: 'John Doe',
                      month: '12',
                      price: '\$500',
                      description: 'Description of loan request 1',
                      onApprove: () {},
                    ),
                    ApprovalCardWidget(
                      name: 'Jane Smith',
                      month: '24',
                      price: '\$800',
                      description: 'Description of loan request 2',
                      onApprove: () {},
                    ),
                    ApprovalCardWidget(
                      name: 'Alice Williams',
                      month: '18',
                      price: '\$1000',
                      description: 'Description of loan request 3',
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
