import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loanlolly/constants.dart';
import 'package:loanlolly/widgets/custom_appbar_widget.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(scaffoldKey: _scaffoldKey, headerText: "Profile", onTap: () {}),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(AppConstants.defaultPadding),
            decoration: BoxDecoration(
              color: AppConstants.primaryColor,
              borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(user?.photoURL ?? ''),
                ),
                SizedBox(height: AppConstants.defaultSpacing),
                Text(
                  'Display Name: ${user?.displayName ?? ''}',
                  style: TextStyle(fontSize: AppConstants.defaultFontSize, color: AppConstants.whiteColor),
                ),
                SizedBox(height: AppConstants.defaultSpacing),
                Text(
                  'Email: ${user?.email ?? ''}',
                  style: TextStyle(fontSize: AppConstants.defaultFontSize, color: AppConstants.whiteColor),
                ),
                SizedBox(height: AppConstants.defaultSpacing),
                ElevatedButton(
                  onPressed: () {
                    // Implement logout logic
                  },
                  child: Text('Logout'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
