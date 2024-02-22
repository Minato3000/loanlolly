import 'package:flutter/material.dart';
import 'package:loanlolly/screens/home_screen.dart';
import 'package:loanlolly/widgets/custom_drawer.dart';
import 'package:loanlolly/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final VoidCallback onTap;
  final String? headerText;

  CustomAppBar(
      {required this.scaffoldKey, required this.onTap, this.headerText});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              CustomDrawer().openDrawer(context);
            },
          );
        }),
      ),
      iconTheme: IconThemeData(
        color: AppConstants.whiteColor,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(12.0),
              child: Image.asset(
                'assets/images/logo.png',
                height: 50.0,
                width: 100.0,
              ),
            ),
          ),
          if (headerText != null)
            Expanded(
              child: Center(
                child: Text(
                  headerText!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppConstants.whiteColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          if (headerText == null)
            InkWell(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/images/candy.png',
                  fit: BoxFit.contain,
                  width: 40.0,
                  height: 40.0,
                ),
              ),
            ),
        ],
      ),
      centerTitle: true,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/llbg.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
