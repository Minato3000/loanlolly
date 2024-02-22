import 'package:flutter/material.dart';
import 'package:loanlolly/constants.dart';
import 'package:loanlolly/screens/borrower/loan_approve_screen.dart';
import 'package:loanlolly/screens/lender/loan_get_screen.dart';
import 'package:loanlolly/screens/lender/lender_home_screen.dart';
import 'package:loanlolly/screens/borrower/borrower_home_screen.dart';
import 'package:loanlolly/widgets/custom_appbar_widget.dart';
import 'package:loanlolly/widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isToggleOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      appBar: CustomAppBar(
        scaffoldKey: _scaffoldKey,
        onTap: () {
          if (!_isToggleOn) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoanGetScreen(),
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoanApproveScreen(),
              ),
            );
          }
        },
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 20.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Transform.scale(
                    scale: 0.7,
                    child: Switch(
                      value: _isToggleOn,
                      onChanged: (value) {
                        setState(() {
                          _isToggleOn = value;
                        });
                      },
                      activeTrackColor: AppConstants.pinkColor.withOpacity(0.9),
                      inactiveThumbColor: AppConstants.pinkColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: _isToggleOn ? LenderHomeScreen() : BorrowerScreen(),
          ),
        ],
      ),
    );
  }
}
