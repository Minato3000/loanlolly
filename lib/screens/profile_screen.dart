import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loanlolly/constants.dart';
import 'package:loanlolly/widgets/custom_appbar_widget.dart';
import 'package:loanlolly/widgets/custom_drawer.dart';

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
      drawer: CustomDrawer(),
      appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey, headerText: "Profile", onTap: () {}),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(AppConstants.defaultPadding),
          height: 400,
          width: 300,
          decoration: BoxDecoration(
            color: AppConstants.primaryColor,
            borderRadius:
                BorderRadius.circular(AppConstants.defaultBorderRadius),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage:
                    user?.photoURL != null && user!.photoURL!.isNotEmpty
                        ? NetworkImage(user!.photoURL!)
                        : AssetImage('assets/images/candy_user.jpg')
                            as ImageProvider,
              ),
              SizedBox(height: AppConstants.defaultSpacing),
              Text(
                'Display Name: ${user?.displayName ?? ''}',
                style: TextStyle(
                    fontSize: AppConstants.defaultFontSize,
                    color: AppConstants.whiteColor),
              ),
              SizedBox(height: AppConstants.defaultSpacing),
              Text(
                'Email: ${user?.email ?? ''}',
                style: TextStyle(
                    fontSize: AppConstants.defaultFontSize,
                    color: AppConstants.whiteColor),
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
    );
  }
}
