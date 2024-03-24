import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loanlolly/screens/history_screen.dart';
import 'package:loanlolly/screens/home_screen.dart';
import 'package:loanlolly/screens/message_screen.dart';
import 'package:loanlolly/screens/profile_screen.dart';
import 'package:loanlolly/widgets/custom_drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  void openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  void logout(BuildContext context) {
    FirebaseAuth.instance.signOut();

    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromRGBO(11, 13, 137, 1),
        child: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 50),
              Row(children: [
                Image.asset(
                  'assets/images/logo.png',
                ),
              ]),
              SizedBox(height: 20),
              Container(
                width: 250,
                child: Divider(
                  height: 6,
                  thickness: 2,
                  indent: 2,
                  endIndent: 4,
                  color: const Color.fromARGB(255, 230, 230, 230),
                ),
              ),
              SizedBox(height: 20),
              CustomDrawerItem(
                iconData: CustomDrawerIcons.home,
                title: 'Home',
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
              ),
              SizedBox(height: 20),
              CustomDrawerItem(
                iconData: CustomDrawerIcons.messenger,
                title: 'Message',
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MessageScreen()),
                  );
                },
              ),
              SizedBox(height: 20),
              CustomDrawerItem(
                iconData: CustomDrawerIcons.history,
                title: 'History',
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoanHistoryScreen()),
                  );
                },
              ),
              SizedBox(height: 20),
              CustomDrawerItem(
                iconData: CustomDrawerIcons.profile,
                title: 'Profile',
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
                },
              ),
              SizedBox(height: 20),
              CustomDrawerItem(
                iconData: CustomDrawerIcons.logout,
                title: 'Logout',
                onTap: () => logout(context),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
